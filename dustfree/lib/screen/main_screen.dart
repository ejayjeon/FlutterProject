import 'package:dustfree/components/main_appbar.dart';
import 'package:dustfree/components/main_drawer.dart';
import 'package:dustfree/components/main_dust_box.dart';
import 'package:dustfree/components/main_stat_box.dart';
import 'package:dustfree/const/colors.dart';
import 'package:dustfree/const/regions.dart';
import 'package:dustfree/const/status_level.dart';
import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/repository/stat_repository.dart';
import 'package:dustfree/utils/data_utils.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

// StatefulWidget이용 : 데이터를 위젯이 생성될 때 최초로 한 번만 가져오기 위해
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String region = regions[0];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

// 데이터 요청은 무조건 Async, initState는 async로 만들 수 없음
// 네트워크나 데이터베이스 요청을 하고, 그런 데이터를 뿌려주는 역할을 하는 것을 '레포지토리' 라고 부름
  Future<Map<ItemCode, List<StatModel>>> fetchData() async {
    // 모든 fetchData에 대해서 for Loop을 돌린다

    Map<ItemCode, List<StatModel>> stats = {};
    // await 하지 않은 future 값들을 리스트 안에다가 저장해 놓은 후에, 동시에 요청을 보내고 받아오는 값들을 병렬로 처리한다.
    List<Future> futures = [];
    for (ItemCode itemCode in ItemCode.values) {
      // await를 전부 하고나면 future 값이 될 수 없다
      futures.add(
        StatRepository.fetchData(
          itemCode: itemCode,
        ),
      );
      // 응답에 대한 데이터 -> map 형태
      // return statModels;
    }
    final results = await Future.wait(futures);
    // 리스트안의 모든 Future 값들이 끝날 때까지 여기서 기다리는 것
    // fetchData()에 await를 바로 넣어주지 않았기 때문에 fetchData()의 실행이 끝날 때까지 기다릴 필요가 없게된다. -> 값이 돌아오지 않은 상태에서 for Loop이 돈다

    for (int i = 0; i < results.length; i++) {
      final key = ItemCode.values[i];
      final value = results[i];

      stats.addAll(
        {
          key: value,
        },
      );
    }
    return stats;
  }

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
        color: fontLight, fontSize: 20.0, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: defaultBg,
      drawer: MainDrawer(
        selectedRegion: region,
        onRegionTap: (String region) {
          setState(() {
            this.region = region;
          });
          Navigator.of(context).pop();
        },
      ),
      body: FutureBuilder<Map<ItemCode, List<StatModel>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('에러가 있습니다'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              // 로딩상태
              child: CircularProgressIndicator(),
            );
          }

// 무조건 데이터가 있는 상태 : 이 데이터를 List<StatModel> 에 넣는다.
// 가장 최근의 데이터는 이 <StatModel>의 가장 첫 번째가 된다.
          Map<ItemCode, List<StatModel>> stats = snapshot.data!;
          // 키 값으로 ItemCode, 그에 해당되는 값들을 Value에 넣음 그 아이템들 중에서 PM10이라는 값을 가진 데이터 중에서 0번을 가져오면 가장 최근의 값을 가져오게 됨
          StatModel pm10RecentStat = stats[ItemCode.PM10]![0];

// statusLevel을 찾는데, 이 데이터들 중 미세먼지 지수가 < 가지고온 최근 데이터 중 seoul 보다 작은지 비교한 다음에, 걸러진 기준들 중에서 가장 마지막(last) 번째를 불러온다.
          final status = DataUtils.getStatusFromItemCodeFromValue(
              value: pm10RecentStat.seoul,
              itemCode: ItemCode.PM10); // 미세먼지를 기준으로만 가져옴

          return CustomScrollView(
            slivers: [
              MainAppbar(
                stat: pm10RecentStat,
                status: status,
                region: region,
              ),
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
          );
        },
      ),
    );
  }
}
