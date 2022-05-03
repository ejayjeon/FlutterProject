import 'package:dustfree/const/colors.dart';
import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/model/status_model.dart';
import 'package:dustfree/utils/data_utils.dart';
import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget {
  final StatusModel status;
  final StatModel stat;
  final String region;
  const MainAppbar(
      {required this.status,
      required this.stat,
      required this.region,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.w700, color: fontLight);
    // final now = DateTime.utc(
    //     DateTime.now().year, DateTime.now().month, DateTime.now().day);
    const boxPadding = SizedBox(
      height: 16.0,
    );
    return SliverAppBar(
      backgroundColor: status.primaryColor,
      // 앱바가 늘어날 수 있는 공간
      expandedHeight: 500,
      // 앱을 스크롤하면 사라질 수 있는 공간 : flexible-space
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            //The height of the toolbar component of the [AppBar]
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  region, // 외부 데이터와 관계 없음
                  style: ts.copyWith(
                    color: status.detailFontColor,
                  ),
                ),
                boxPadding,
                Text(
                  DataUtils.getTimeFromDateTime(dateTime: stat.dateTime),
                  // stat.dataTime.toString().substring(0, 10),
                  style: ts.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: status.detailFontColor),
                ),
                boxPadding,
                Image.asset(
                  status.imgPath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                boxPadding,
                Text(
                  status.label,
                  style: ts.copyWith(
                    color: status.detailFontColor,
                  ),
                ),
                boxPadding,
                Text(
                  status.comment,
                  style: ts.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: status.detailFontColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
