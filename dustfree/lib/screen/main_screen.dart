import 'package:dio/dio.dart';
import 'package:dustfree/components/main_appbar.dart';
import 'package:dustfree/components/main_drawer.dart';
import 'package:dustfree/const/regions.dart';
import 'package:dustfree/container/category_card.dart';
import 'package:dustfree/container/hourly_card.dart';
import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/repository/stat_repository.dart';
import 'package:dustfree/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

// StatefulWidget이용 : 데이터를 위젯이 생성될 때 최초로 한 번만 가져오기 위해
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String region = regions[0];
  bool isExpanded = true;
  ScrollController scrollController = ScrollController();
  // 지역값에 해당하는 값을 가고 와야 함
  @override
  // 데이터 요청은 무조건 Async, initState는 async로 만들 수 없음
// 네트워크나 데이터베이스 요청을 하고, 그런 데이터를 뿌려주는 역할을 하는 것을 '레포지토리' 라고 부름
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final now = DateTime.now();
      final fetchTime = DateTime(now.year, now.month, now.day, now.hour);
      final box = Hive.box<StatModel>(ItemCode.PM10.name);
      // 값이 하나도 없다면 last가 없다

// fetchTime : 즉 현재 시간과, recent의 dateTime이 같으면 또 다시 렌더링할 필요가 없다는 것을 if문으로 걸러줌
      if (box.values.isNotEmpty &&
          (box.values.last as StatModel).dateTime.isAtSameMomentAs(fetchTime)) {
        print('이미 최신 데이터가 있습니다');
        return;
      }
      List<Future> futures = [];
      for (ItemCode itemCode in ItemCode.values) {
        // 모든 fetchData에 대해서 for Loop을 돌린다
        // key : ItemCode, Value : ListStatModel
        //Map<ItemCode, List<StatModel>> stats = {};
        // await 하지 않은 future 값들을 리스트 안에다가 저장해 놓은 후에, 동시에 요청을 보내고 받아오는 값들을 병렬로 처리한다.
        // await를 전부 하고나면 future 값이 될 수 없다
        // 최근 24개 데이터를 제외하고 나머지는 모두 삭제해줘야함
        futures.add(
          StatRepository.fetchData(
            itemCode: itemCode,
          ),
        );
      }
      final results = await Future.wait(futures);
      // 클라우드 서버 비용 측정은, 클라우드에 얼만큼 요청을 했느냐에 따라 비용이 측정되는데, 불러올 필요가 없는 데이터를 중복으로 받아오게 되면 손해.
      // ListStatModel
      // 리스트안의 모든 Future 값들이 끝날 때까지 여기서 기다리는 것
      // fetchData()에 await를 바로 넣어주지 않았기 때문에 fetchData()의 실행이 끝날 때까지 기다릴 필요가 없게된다. -> 값이 돌아오지 않은 상태에서 for Loop이 돈다

// Hive 안에 데이터 넣기 -> Hive 안에 들어간 데이터를 가지고 와서 화면에 뿌려줌
      for (int i = 0; i < results.length; i++) {
        final key = ItemCode.values[i]; // ItemCode
        final value = results[i];
        final box = Hive.box<StatModel>(key.name);
        box.values.toList();
        for (StatModel stat in value) {
          // put은 키를 지정할 수 있고 key는 중복을 할 수 없다
          box.put(stat.dateTime.toString(), stat);
        }
        // 박스 안의 모든 키를 다 가지고 옴
        final allKeys = box.keys.toList();
        if (allKeys.length > 24) {
          // start : 시작 인덱스
          // End : 끝 인덱스
          // [1, 2, 3, 4, 5].sublist(1, 3)
          // 마지막 인덱스를 제외한 2,3을 가지고 옴
          final deleteKeys = allKeys.sublist(0, allKeys.length - 24);
          box.deleteAll(deleteKeys);
        }
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('인터넷 연결이 원활하지 않습니다'),
        ),
      );
    }
  }

  // 스크롤을 했을 때 expanded인 것을 확인하기 위해
  scrollListener() {
    bool isExpanded = scrollController.offset < 500 - kToolbarHeight;
    if (isExpanded != this.isExpanded) {
      setState(
        () {
          this.isExpanded = isExpanded;
        },
      );
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box<StatModel>(ItemCode.PM10.name).listenable(),
      builder: (context, box, widget) {
        if (box.values.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final recentStat = box.values.toList().last as StatModel;
        final status = DataUtils.getStatusFromItemCodeFromValue(
            value: recentStat.getLevelFromRegion(region),
            itemCode: ItemCode.PM10);
        return Scaffold(
          drawer: MainDrawer(
            darkColor: status.darkColor,
            lightColor: status.lightColor,
            selectedRegion: region,
            onRegionTap: (String region) {
              setState(() {
                this.region = region;
              });
              Navigator.of(context).pop();
            },
          ),
          body: Container(
            color: status.primaryColor,

            // 모든 스크롤이 가능한 위젯에서는 한 번 당겼을 때 데이터를 새로 받아올 수 있다
            child: RefreshIndicator(
              onRefresh: () async {
                await fetchData();
              },
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  MainAppbar(
                    isExpanded: isExpanded,
                    stat: recentStat,
                    status: status,
                    region: region,
                    dateTime: recentStat.dateTime,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // 종류별
                        CategoryCard(
                          darkColor: status.darkColor,
                          lightColor: status.lightColor,
                          region: region,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        // 시간별
                        ...ItemCode.values.map(
                          (e) {
                            return HourlyCard(
                              region: region,
                              darkColor: status.darkColor,
                              lightColor: status.lightColor,
                              itemCode: e,
                            );
                          },
                        ).toList(),
                        const SizedBox(
                          height: 32.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
