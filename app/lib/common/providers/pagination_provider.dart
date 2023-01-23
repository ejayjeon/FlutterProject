import 'package:app/common/models/i_pagination.dart';
import 'package:app/common/models/pagination_model.dart';
import 'package:app/common/models/pagination_params.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _PaginationInfo {
  final int fetchCount;
  final bool fetchMore;
  final bool forceRefetch;

  _PaginationInfo({
    this.fetchCount = 20,
    this.fetchMore = false,
    this.forceRefetch = false,
  });
}

class PaginationProvider<T extends ModelWithId, U extends IPagination<T>>
    extends StateNotifier<PaginationBase> {
  final U repository;
  final paginationThrottle = Throttle(
    Duration(seconds: 2),
    initialValue: _PaginationInfo(),
    checkEquality: false,
  );

  PaginationProvider({required this.repository}) : super(PaginationLoading()) {
    paginate();

    paginationThrottle.values.listen(
      (state) {
        _throttledPagination(state);
      },
    );
  }

  Future<void> paginate({
    int fetchCount = 20,
    bool fetchMore = false,
    bool forceRefetch = false,
  }) async {
    paginationThrottle.setValue(_PaginationInfo(
      fetchMore: fetchMore,
      fetchCount: fetchCount,
      forceRefetch: forceRefetch,
    ));
  }

  _throttledPagination(_PaginationInfo info) async {
    final fetchCount = info.fetchCount;
    final fetchMore = info.fetchMore;
    final forceRefetch = info.forceRefetch;

    try {
      // State 상태에 따른 분류
      // 1) Pagination : 정상적으로 데이터가 로딩된 상태
      // 2) PaginationLoading : 데이터가 로딩중인 상태 (현재 캐시 X)
      // 3) PaginationError : 에러 상태
      // 4) PaginationRefetching : 페이지로부터 다시 데이터를 가져올 때
      // 5) PaginationFetchMore : 추가 데이터를 요청 할 때

      if (state is Pagination && !forceRefetch) {
        final currentState = state as Pagination;

        // 바로 반환하는 상황 1): hasMore = false
        if (!currentState.meta.hasMore) {
          return;
        }
      }

      // 여러 가지 상황
      final isLoading = state is PaginationLoading;
      final isRefetching = state is PaginationRefetching;
      final isFetchingMore = state is PaginationFetchingMore;

      // 바로 반환하는 상황 2) : 현재 상태가 fetchMore이면서
      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      // PaginationParams 생성
      PaginationParams paginationParams = PaginationParams(
        count: fetchCount,
      );

      // 데이터를 추가로 더 요청하는 상황
      if (fetchMore) {
        final currentState = state as Pagination<T>;

        state = PaginationFetchingMore(
          meta: currentState.meta,
          data: currentState.data,
        );

        paginationParams = paginationParams.copyWith(
          after: currentState.data.last.id,
        );
      } else {
        if (state is Pagination && !forceRefetch) {
          final currentState = state as Pagination<T>;

          state = PaginationRefetching<T>(
            meta: currentState.meta,
            data: currentState.data,
          );
        } else {
          state = PaginationLoading();
        }
      }

      final resp = await repository.pagination(
        paginationParams: paginationParams,
      );

      if (state is PaginationFetchingMore) {
        final currentState = state as PaginationFetchingMore<T>;

        state = resp.copyWith(
          data: [
            ...currentState.data,
            ...resp.data,
          ],
        );
      } else {
        state = resp;
      }
    } catch (error, stack) {
      print(error);

      state = PaginationError(message: '데이터를 가져오지 못했습니다');
    }
  }
}
