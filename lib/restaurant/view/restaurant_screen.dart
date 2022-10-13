import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/model/cursor_pagination_model.dart';
import 'package:nosh/restaurant/components/restaurant_card.dart';
import 'package:nosh/restaurant/model/restaurant_model.dart';
import 'package:nosh/restaurant/provider/restaurant_repository_provider.dart';
import 'package:nosh/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  // Future<List<RestaurantModel>> pagenateRestaurant(WidgetRef ref) async {
  //   final dio = ref.watch(dioProvider);

  // final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

  // final resp =
  //     await RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant')
  //         .paginate();

  // final resp = await dio.get(
  //   'http://$ip/restaurant',
  //   options: Options(
  //     headers: {'authorization': 'Bearer $accessToken'},
  //   ),
  // );
  // Future 값
  //   return resp.data;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder<CursorPagination<RestaurantModel>>(
          future: ref.watch(restaurantRepositoryProvider).paginate(),
          builder: (context,
              AsyncSnapshot<CursorPagination<RestaurantModel>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (_, index) {
                final pItem = snapshot.data!.data[index];
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
            );
          },
        ),
      ),
    );
  }
}
