import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dustfree/components/main_appbar.dart';
import 'package:dustfree/components/main_drawer.dart';
import 'package:dustfree/components/main_dust_box.dart';
import 'package:dustfree/components/main_stat_box.dart';
import 'package:dustfree/const/colors.dart';
import 'package:dustfree/const/data.dart';
import 'package:dustfree/model/stat_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

// StatefulWidget이용 : 데이터를 위젯이 생성될 때 최초로 한 번만 가져오기 위해
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

// 데이터 요청은 무조건 Async, initState는 async로 만들 수 없음
  fetchData() async {
    final response = await Dio().get(
      // 요청 url
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      // QueryParam
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
        'numOfRows': 30,
        'pageNo': 1,
        'itemCode': 'PM10',
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK'
      },
    );
    // 응답에 대한 데이터 -> map 형태
    print(
      response.data['response']['body']['items'].map(
        (item) => StatModel.fromJson(json: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
        color: fontLight, fontSize: 20.0, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: defaultBg,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          const MainAppbar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                MainStatBox(),
                const SizedBox(
                  height: 8.0,
                ),
                MainDustBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
