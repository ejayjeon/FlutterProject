import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:nosh/common/repository/base_pagination_repository.dart';

class PaginationProvider<U extends IBasePaginationRepository>
    extends StateNotifier<CursorPaginationBase> {
  // repository 일반화
  final U repository;
  PaginationProvider({
    required this.repository,
  }) : super(CursorPaginationLoading());

  Future<void> paginate({
    int fetchCount = 10,
    bool fetchMore = false, // 현재 데이터가 있는지?
    bool forceRefetch = false, // 강제 로딩 : CursorPaginationLoading()
  }) async {
    try {
      PaginationParams paginationParams = PaginationParams(
        count: fetchCount,
      );

      /*
      데이터가 있는 상황에서, 더 이상 값을 가져오지 않고 바로 반환하는 경우 (더 이상 Paginate() 함수를 실행하지 않는다)
      1) hasMore가 false일 때, 
      2) 이미 데이터를 요청해서 가져오는 상황 (fetchMore == true)
      3) fetchMore + 로딩 중인 각종 상태
      */
      if (state is CursorPagination && !forceRefetch) {
        final pState = state as CursorPagination;

        if (!pState.meta.hasMore) {
          return;
        }
      }
      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      /* 
      반환하는 경우가 아니라면, 데이터를 추가로 요청하는 상태임
      1) CursorPagination : 정상적으로 데이터가 있는 상태
      2) CursorPaginationLoading: 데이터가 로딩중인 상태 (캐시 없음))
      3) CursorPaginationError : 에러가 있는 상태
      4) CursorPaginationRefetching : 추가
      5) CursorPaginationFetchingMore : 추가 데이터를 paginate 해오라는 요청을 받았을 때
      */
      if (fetchMore) {
        final pState = state as CursorPagination;

        state = CursorPaginationFetchingMore(
          meta: pState.meta,
          data: pState.data,
        );

        /*불러온 데이터의 마지막 아이디를 넣어준다 
        마지막 아이디를 기준으로, 최신의 데이터를 가져온다
        */
        paginationParams = paginationParams.copyWith(
          after: pState.data.last.id,
        );
      } else {
        if (state is CursorPagination && !forceRefetch) {
          final pState = state as CursorPagination;
          state = CursorPaginationRefetching(
            meta: pState.meta,
            data: pState.data,
          );
        } else {
          state = CursorPaginationLoading();
        }
      }

// repository는 매번 바뀌어야 함. > 인터페이스를 이용한다
      final resp = await repository.paginate(
        paginationParams: paginationParams,
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
