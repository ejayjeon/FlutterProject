import 'package:app/common/const/ip.dart';
import 'package:app/common/const/storage.dart';
import 'package:app/common/layout/main_layout.dart';
import 'package:app/script/components/restaurant_card.dart';
import 'package:app/script/components/script_detail_card.dart';
import 'package:app/script/model/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String get routeName => 'home';
  final ValueNotifier themeNotifier;
  const HomeScreen({
    super.key,
    required this.themeNotifier,
  });

  Future<List> paginateScript() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $refreshToken',
        },
      ),
    );
    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      needFab: true,
      fabIcon: Icons.add,
      fabPressed: () {},
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: ScriptDetailCard(),
        // child: FutureBuilder<List>(
        //   future: paginateScript(),
        //   builder: (context, AsyncSnapshot<List> snapshot) {
        //     print(snapshot.error);
        //     if (!snapshot.hasData) return Container();
        //     return ListView.builder(
        //       itemCount: snapshot.data?.length,
        //       itemBuilder: (_, index) {
        //         final item = snapshot.data?[index];
        //         final pItem = RestaurantModel.fromJson(
        //           json: item,
        //         );
        //         return RestaurantCard.fromModel(model: pItem);
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
