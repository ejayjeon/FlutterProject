import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/common/model/pagination_params.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';
import 'package:nosh/restaurant/provider/restaurant_repository_provider.dart';
import 'package:nosh/restaurant/repository/restaurant_repository.dart';

final restaurantDetailProvider =
    Provider.family<RestaurantModel?, String>((ref, id) {
  final state = ref.watch(restaurantProvider);

  if (state is! CursorPagination) {
    return null;
  }

  return state.data.firstWhere((element) => element.id == id);
});

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
    // CursorPaginationBase(빈 Abstract class)를 상속받는 로딩 클래스, 즉 가장 처음 아무 데이터도 없는 상태를 로딩 상태로 규정
    // 이 함수를 실행하면, pagination이 실행, 위젯에서는 [] 상태를 바라보고 있다가 이 함수가 실행되면 새로운 상태를 렌더링!
  }) : super(CursorPaginationLoading()) {
    paginate();
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

  void getDetail({
    required String id,
  }) async {
    // 1. 만약에 아직 데이터가 하나도 없는 상태라면(CursorPagination)
    if (state is! CursorPagination) {
      await paginate();
    }

    // 2. state가 CursorPagenation이 아니면 return

    if (state is! CursorPagination) {
      return;
    }

    // 3. 이제부터 들어오는 데이터는 무조건 CursorPagination
    final pState = state as CursorPagination;
    final resp = await repository.getRestaurantDetail(id: id); // restaurant

    // 4. pState에서 id에 해당하는 값을 찾은 다음, 그 값을 새로 받은 resp로 대체해주면 됨
    state = pState.copyWith(
      data: pState.data
          .map<RestaurantModel>(
            (e) => e.id == id ? resp : e,
          )
          .toList(),
    );
  }

  /* [re(1), re(2), re(3)] 인 데이터가 있을 때,
    id : 2인 Detail Model을 가져와 !
    -> getDetail(id: 2);
  */
}
