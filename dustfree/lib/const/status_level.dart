import 'package:dustfree/const/colors.dart';
import 'package:dustfree/model/status_model.dart';

/*
  * 1) 최고
  *
  * 미세먼지 : 0-15
  * 초미세먼지 : 0-8
  * 오존(O3) : 0-0.02
  * 이산화질소(NO2) : 0-0.02
  * 일산화탄소(CO) : 0-0.02
  * 아황산가스(SO2) : 0-0.01
  *
  * 2) 좋음
  *
  * 미세먼지 : 16-30
  * 초미세먼지 : 9-15
  * 오존 : 0.02 - 0.03
  * 이산화질소 : 0.02-0.03
  * 일산화탄소 : 1-2
  * 아황산가스 : 0.01-0.02
  *
  * 3) 양호
  *
  * 미세먼지 : 31-40
  * 초미세먼지 : 16-20
  * 오존 : 0.03-0.06
  * 이산화질소 : 0.03-0.05
  * 일산화탄소 : 2-5.5
  * 아황산가스 : 0.02-0.04
  *
  * 4) 보통
  *
  * 미세먼지 : 41-50
  * 초미세먼지 : 21-25
  * 오존 : 0.06-0.09
  * 이산화질소 : 0.05-0.06
  * 일산화탄소 : 5.5-9
  * 아황산가스 : 0.04-0.05
  *
  * 5) 나쁨
  *
  * 미세먼지 : 51-75
  * 초미세먼지 : 26-37
  * 오존 : 0.09-0.12
  * 이산화질소 : 0.06-0.13
  * 일산화탄소 : 9-12
  * 아황산가스 : 0.05-0.1
  *
  * 6) 상당히나쁨
  *
  * 미세먼지 : 76-100
  * 초미세먼지 : 38-50
  * 오존 : 0.12-0.15
  * 이산화질소 : 0.13-0.2
  * 일산화탄소 : 12-15
  * 아황산가스 : 0.1-0.15
  *
  * 7) 매우 나쁨
  *
  * 미세먼지 : 101-150
  * 초미세먼지 : 51-75
  * 오존 : 0.15-0.38
  * 이산화질소 : 0.2-1.1
  * 일산화탄소 : 15-32
  * 아황산가스 : 0.15-0.16
  *
  * 8) 최악
  *
  * 미세먼지 : 151~
  * 초미세먼지 : 76~
  * 오존 : 0.38~
  * 이산화질소 : 1.1~
  * 일산화탄소 : 32~
  * 아황산가스 : 0.16~
  * */

final statusLevel = [
  // 최고
  StatusModel(
      level: 0,
      label: '최고',
      primaryColor: bestBg,
      darkColor: bestBgDark,
      lightColor: bestBgLight,
      detailFontColor: fontDark,
      imgPath: 'assets/img/noto_g3.png',
      comment: '우와 100년에 한 번 오는 날!',
      minFineDust: 0,
      minUltraFineDust: 0,
      minO3: 0,
      minNO2: 0,
      minCO: 0,
      minSO2: 0),
  StatusModel(
      level: 1,
      label: '좋음',
      primaryColor: niceBg,
      darkColor: niceBgDark,
      lightColor: niceBgLight,
      detailFontColor: fontDark,
      imgPath: 'assets/img/noto_g2.png',
      comment: '공기가 청량하네요! 외부 활동 하기에도 좋아요',
      minFineDust: 16,
      minUltraFineDust: 9,
      minO3: 0.02,
      minNO2: 0.02,
      minCO: 1,
      minSO2: 0.01),
  StatusModel(
      level: 2,
      label: '양호',
      primaryColor: goodBg,
      darkColor: goodBgDark,
      lightColor: goodBgLight,
      detailFontColor: fontDark,
      imgPath: 'assets/img/noto_g1.png',
      comment: '간단한 외부활동을 하기에 좋네요',
      minFineDust: 31,
      minUltraFineDust: 16,
      minO3: 0.03,
      minNO2: 0.03,
      minCO: 2,
      minSO2: 0.02),
  StatusModel(
      level: 3,
      label: '보통',
      primaryColor: defaultBg,
      darkColor: defaultBgDark,
      lightColor: defaultBgLight,
      detailFontColor: fontDark,
      imgPath: 'assets/img/noto_default.png',
      comment: '오늘 공기는 나쁘지 않네요!',
      minFineDust: 41,
      minUltraFineDust: 21,
      minO3: 0.06,
      minNO2: 0.05,
      minCO: 5,
      minSO2: 0.04),
  StatusModel(
      level: 4,
      label: '나쁨',
      primaryColor: notGoodBg,
      darkColor: notGoodBgDark,
      lightColor: notGoodBgLight,
      detailFontColor: fontDark,
      imgPath: 'assets/img/noto_ng1.png',
      comment: '바깥 공기가 좋지 않네요.',
      minFineDust: 51,
      minUltraFineDust: 26,
      minO3: 0.09,
      minNO2: 0.06,
      minCO: 9,
      minSO2: 0.05),
  StatusModel(
      level: 5,
      label: '주의',
      primaryColor: carefulBg,
      darkColor: carefulBgDark,
      lightColor: carefulBgLight,
      detailFontColor: fontLight,
      imgPath: 'assets/img/noto_ng2.png',
      comment: '공기가 나빠요. 외출 시 마스크를 챙겨 주세요.',
      minFineDust: 76,
      minUltraFineDust: 38,
      minO3: 0.12,
      minNO2: 0.13,
      minCO: 12,
      minSO2: 0.1),
  StatusModel(
      level: 6,
      label: '경고',
      primaryColor: warningBg,
      darkColor: warningBgDark,
      lightColor: warningBgLight,
      detailFontColor: fontLight,
      imgPath: 'assets/img/noto_ng3.png',
      comment: '공기가 매우 좋지 않네요. 외부활동을 자제해 주세요!',
      minFineDust: 101,
      minUltraFineDust: 51,
      minO3: 0.15,
      minNO2: 0.2,
      minCO: 15,
      minSO2: 0.15),
  StatusModel(
      level: 7,
      label: '최악',
      primaryColor: terribleBg,
      darkColor: terribleBgDark,
      lightColor: terribleBgLight,
      detailFontColor: fontLight,
      imgPath: 'assets/img/noto_ng4.png',
      comment: '숨을 쉴 수가 없어요... 집에만 계세요.',
      minFineDust: 151,
      minUltraFineDust: 76,
      minO3: 0.38,
      minNO2: 1.1,
      minCO: 32,
      minSO2: 0.16),
];
