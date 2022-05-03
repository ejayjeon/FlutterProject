import 'package:dustfree/components/card_title.dart';
import 'package:dustfree/components/main_card.dart';
import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/utils/data_utils.dart';
import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String category;
  final String region;
  final List<StatModel> statModel;
  const HourlyCard(
      {required this.category,
      required this.region,
      required this.statModel,
      required this.darkColor,
      required this.lightColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainCard(
      bgColor: lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            bgColor: darkColor,
            title: '시간별 ${this.category}',
          ),
          Column(
            children: statModel
                .map(
                  (e) => renderRow(statModel: e),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget renderRow({required StatModel statModel}) {
    final status = DataUtils.getStatusFromItemCodeFromValue(
      value: statModel.getLevelFromRegion(region),
      itemCode: statModel.itemCode,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          // mainAxixAlignment 대신 각자 위젯을 Expanded로 감싸준 이유는 글자수에 따라 아이콘의 정렬이 비뚤비뚤하기 때문
          Expanded(
            child: Text('${statModel.dateTime.hour}시'),
          ),
          Expanded(
            child: Image.asset(
              status.imgPath,
              height: 20.0,
            ),
          ),
          Expanded(
            child: Text(
              status.label,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
