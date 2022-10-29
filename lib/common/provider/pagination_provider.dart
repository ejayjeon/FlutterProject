import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/model_with_id.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:nosh/common/repository/base_pagination_repository.dart';

/** T 타입은 Pagination에서 가져오는 데이터 (id) 의 실제 데이터값이 될 것*/
class PaginationProvider<T extends IModelWithId,
        U extends IBasePaginationRepository<T>>
    /** 입력받은 T를 다시 여기에 넣어줌 */
    extends StateNotifier<CursorPaginationBase> {
  // repository 일반화
  final U repository;
  PaginationProvider({
    required this.repository,
  }) : super(CursorPaginationLoading()) {
    paginate();
    /** PaginationProvider를 extends 하는 모든 클래스들은 생성되자마다 paginate를 불러오게 된다 */
  }

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
        final pState = state as CursorPagination<T>;

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
        final pState = state as CursorPagination<T>;
        /**외부에서 IModelWithId를 extends한 클래스에서 값을 받아서 그 모델을 기준으로 생성된 값을 가정할 것 */

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
          final pState = state as CursorPagination<T>;
          /** 아래 리패칭만 제네릭을 써주고 위에 pState에 제네릭을 추가해주지 않으면, 들어가는 데이터리스트가 dynamic 형태이기 때문에 에러가 나게 된다*/
          state = CursorPaginationRefetching<T>(
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
        final pState = state as CursorPaginationFetchingMore<T>;

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
