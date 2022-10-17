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
    /** 
     * 현재 스크롤의 위치 : controller.offset
     * 스크롤이 가능한 마지막 위치 : controller.position.maxScrollExtent
    */
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      ref.read(restaurantProvider.notifier).paginate(
            fetchMore: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(restaurantProvider);

    /** 프로바이더의 값이 Loading인 경우, 로딩바 */
    if (data is CursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    /** 프로바이더의 값이 Error인 경우, 에러 데이터 */
    if (data is CursorPaginationError) {
      return Center(
        child: Text(data.message),
      );
    }

    /** 로딩, 에러를 제외하고, CursorPaginationBase를 상속받은 경우  */
    final cp = data as CursorPagination;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        controller: controller,
        // FutureBuild : 추가로 데이터를 요청하기 위해 사용, 프로바이더를 사용해서, async 로직을 완료한 경우 굳이 FutureBuilder를 쓸 필요가 없게됨
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
