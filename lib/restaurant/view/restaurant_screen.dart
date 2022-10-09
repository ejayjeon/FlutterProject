import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/restaurant/components/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> pagenateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {'authorization': 'Bearer $accessToken'},
      ),
    );
    // Future 값
    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder(
            future: pagenateRestaurant(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  return RestaurantCard(
                    image: Image.network(
                      'http://$ip${item['thumbUrl']}',
                      fit: BoxFit.cover,
                    ),
                    name: item['name'],
                    // List<dynamic> type을 List<String> type으로 변경
                    tags: List<String>.from(
                      item['tags'],
                    ),
                    ratings: item['ratings'],
                    ratingsCount: item['ratingsCount'],
                    deliveryTime: item['deliveryTime'],
                    deliveryFee: item['deliveryFee'],
                  );
                },
                separatorBuilder: (_, index) {
                  return CustomSizedBox(height: 16.0);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
