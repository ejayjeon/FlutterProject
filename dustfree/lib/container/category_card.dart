import 'package:dustfree/components/card_title.dart';
import 'package:dustfree/components/main_card.dart';
import 'package:dustfree/components/stat_box.dart';
import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryCard extends StatelessWidget {
  final String region;
  final Color darkColor;
  final Color lightColor;
  const CategoryCard(
      {required this.darkColor,
      required this.lightColor,
      required this.region,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: MainCard(
        bgColor: lightColor,
        child: LayoutBuilder(
          // 전체 너비를 찾고 싶은 위젯 바로 위에다가 선언 : LayoutBuilder
          builder: (context, constraint) {
            // constraint : 레이아웃 빌더가 차지하고 있는 공간만큼 제공이 됨
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardTitle(bgColor: darkColor, title: '종류별 통계'),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ListView(
                    // Column 안에서 썼을 때 무조건 Expanded
                    // 스크롤하는 방향을 바꿈 : horizontal viewport unbounded height -> 높이를 지정해주면 됨
                    scrollDirection: Axis.horizontal,
                    // 페이지가 넘어가듯이 : 자동 페이지가 넘어가듯이 physics
                    physics: const PageScrollPhysics(),
                    children: ItemCode.values
                        .map(
                          (ItemCode itemCode) => ValueListenableBuilder<Box>(
                            valueListenable:
                                Hive.box<StatModel>(itemCode.name).listenable(),
                            builder: (context, Box box, widget) {
                              final stat = (box.values.last as StatModel);
                              final status =
                                  DataUtils.getStatusFromItemCodeFromValue(
                                      value: stat.getLevelFromRegion(region),
                                      itemCode: itemCode);
                              return StatBox(
                                width: constraint.maxWidth / 3,
                                category: DataUtils.itemCodeKrString(
                                  itemCode: itemCode,
                                ),
                                imgPath: status.imgPath,
                                level: status.label,
                                stat: '${stat.getLevelFromRegion(
                                  region,
                                )}${DataUtils.getUnitFromItemCode(itemcode: itemCode)}',
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
