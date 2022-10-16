import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';
import 'package:nosh/restaurant/provider/restaurant_repository_provider.dart';
import 'package:nosh/restaurant/repository/restaurant_repository.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>(
  (ref) {
    final repository = ref.watch(restaurantRepositoryProvider);
    final notifier = RestaurantStateNotifier(repository: repository);

    return notifier;
  },
);

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;

  RestaurantStateNotifier({
    required this.repository,
    // 이 안에서 값들을 기억한 다음에 값들을 보여줄 것
    // Cursor Pagination은 리스트가 아님. 하지만 빈 상태로 유지해야 하는데 어떻게 ??
  }) : super(CursorPaginationLoading()) {
    paginate();
  }

  // 이 함수를 실행하면, pagination이 실행, 위젯에서는 [] 상태를 바라보고 있다가 이 함수가 실행되면 새로운 상태를 렌더링!

  //
  void paginate({
    int fetchCount = 20,
    bool fetchMore = false, // 현재 데이터가 있는지?
    bool forceRefetch = false, // 강제 로딩 : CursorPaginationLoading()
  }) async {
    try {
      PaginationParams paginationParams = PaginationParams(
        count: fetchCount,
      );

      // 바로 반환하는 상황

      // 상태가 무조건 CursorPagination (데이터가 있어야돼)
      if (state is CursorPagination && !forceRefetch) {
        final pState = state as CursorPagination;

        // 1) hasMore가 false일 때, (기존 상태에서 이미 다음 데이터가 없다는 값을 들고있다면)
        if (!pState.meta.hasMore) {
          // 데이터를 가져온 적이 있어야지
          return; // Paginate 함수를 더 이상 실행하지 않는다
        }
      }

      // 2) 로딩중, fetchMore가 true일 때
      // 3) 로딩중인데, fetchMore가 아닐 때에는 함수 실행 : 새로 고침의 의도가 있다
      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }
      // 1. 상태가
      // 1) CursorPagination : 정상적으로 데이터가 있는 상태
      // 2) CursorPaginationLoading: 데이터가 로딩중인 상태 (캐시 없음))
      // 3) CursorPaginationError : 에러가 있는 상태
      // 4) CursorPaginationRefetching : 추가
      // 5) CursorPaginationFetchingMore : 추가 데이터를 paginate 해오라는 요청을 받았을 때
      if (fetchMore) {
        // fetchMore가 실행되는 상황에서는 무조건 데이터를 들고있는 상황
        final pState = state as CursorPagination; // instance;

        state = CursorPaginationFetchingMore(
          meta: pState.meta,
          data: pState.data,
        );

        // 불러온 데이터의 마지막 아이디를 넣어준다
        paginationParams = paginationParams.copyWith(
          after: pState.data.last.id, // 마지막 데이터의 아이디
        );
      } else {
        // 기존 데이터가 있는 상황이라면
        if (state is CursorPagination && !forceRefetch) {
          final pState = state as CursorPagination;
          state = CursorPaginationRefetching(
            meta: pState.meta,
            data: pState.data,
          );
        } else {
          // 데이터를 유지할 필요가 없는 상황
          state = CursorPaginationLoading();
        }
      }

      final resp = await repository.paginate(
        paginationParams: paginationParams, // 가장 최근의 데이터
      );

      if (state is CursorPaginationFetchingMore) {
        final pState = state as CursorPaginationFetchingMore;

        // 기존 데이터에 새로 불러온 데이터 추가
        state = resp.copyWith(
          data: [
            ...pState.data, // 기존의 데이터
            ...resp.data, // 새로 추가한 데이터
          ],
        );
      } else {
        state = resp;
      }
    } catch (e) {
      state = CursorPaginationError(message: '데이터를 가져오지 못했습니다');
    }
  }
}
