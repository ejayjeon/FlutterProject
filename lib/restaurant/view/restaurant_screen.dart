import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/restaurant/components/restaurant_card.dart';
import 'package:nosh/restaurant/provider/restaurant_provider.dart';
import 'package:nosh/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  const RestaurantScreen({super.key});

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  // 어디까지 스크롤을 했는지 알기 위해
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);
  }

  void scrollListener() {
    // 현재 위치가 최대 길이보다 조금 덜 되는 위치까지 왔다면
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      ref.read(restaurantProvider.notifier).paginate(
            fetchMore: true,
          );
    }
  }

  // Future<List<RestaurantModel>> pagenateRestaurant(WidgetRef ref) async {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(restaurantProvider);

    // 잘못된 예외처리

    if (data is CursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(), // 순수하게 처음 로딩을 할 때에만
      );
    }

    if (data is CursorPaginationError) {
      return Center(
        child: Text(data.message),
      );
    }

    // 나머지는 CurssorPagination
    // CursorPaginationFetchingMore
    // CursorPaginationRefetching

    final cp = data as CursorPagination;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        controller: controller,
        // FutureBuild X
        itemCount: cp.data.length + 1,
        itemBuilder: (_, index) {
          if (index == cp.data.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Center(
                child: data is CursorPaginationFetchingMore
                    ? CircularProgressIndicator()
                    : Text('마지막 데이터입니다'),
              ),
            );
          }
          final pItem = cp.data[index];
          // Factory Contructor을 만들면 아래에서 해주었던 패턴을 할 필요가 없게 된다
          // final pItem = RestaurantModel.fromJson(item);
          // final pItem = RestaurantModel(
          //   id: item['id'],
          //   name: item['name'],
          //   thumbUrl: 'http://${ip}${item['thumbUrl']}',
          //   tags: List<String>.from(item['tags']),
          //   priceRange: RestaurantPriceRange.values.firstWhere(
          //       (element) => element.name == item['priceRange']),
          //   ratings: item['ratings'],
          //   ratingsCount: item['ratingsCount'],
          //   deliveryTime: item['deliveryTime'],
          //   deliveryFee: item['deliveryFee'],
          // );

          // Factory Model
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RestaurantDetailScreen(
                    id: pItem.id,
                  ),
                ),
              );
            },
            child: RestaurantCard.fromModel(
              model: pItem,
            ),
          );
        },
        separatorBuilder: (_, index) {
          return CustomSizedBox(height: 16.0);
        },
      ),
    );
  }
}
