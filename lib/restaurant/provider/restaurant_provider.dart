import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
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
  paginate({
    int fetchCount = 20,
    bool fetchMore = false, // 현재 데이터가 있는지?
    bool forceRefetch = false, // 강제 로딩 : CursorPaginationLoading()
  }) async {
    // 페이지네이션을 했을 때 상태에 저장
    // 1. 상태가
    // 1) CursorPagination : 정상적으로 데이터가 있는 상태
    // 2) CursorPaginationLoading: 데이터가 로딩중인 상태 (캐시 없음))
    // 3) CursorPaginationError : 에러가 있는 상태
    // 4) CursorPaginationRefetching : 추가
    // 5) CursorPaginationFetchingMore : 추가 데이터를 paginate 해오라는 요청을 받았을 때
  }
}
