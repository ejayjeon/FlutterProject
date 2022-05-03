import 'package:flutter/material.dart';

class StatusModel {
  final int level; // 단계 0 ~ 5
  final String label;
  final Color primaryColor; // 색상
  final Color darkColor;
  final Color lightColor;
  final Color detailFontColor;
  final String imgPath; // 이모지
  final String comment; //코멘트
  final double minFineDust; // 미세먼지 최소치 : 기준을 정해야하기 때문에
  final double minUltraFineDust; // 초미세먼지 최소치
  final double minO3; // 오존 최소치
  final double minNO2; // 이산화질소 최소치
  final double minCO; // 일산화탄소 최소치
  final double minSO2; // 아황산 가스 최소치

  StatusModel({
    // 네임드 파라미터
    required this.level,
    required this.label,
    required this.primaryColor,
    required this.darkColor,
    required this.lightColor,
    required this.detailFontColor,
    required this.imgPath,
    required this.comment,
    required this.minFineDust,
    required this.minUltraFineDust,
    required this.minO3,
    required this.minNO2,
    required this.minCO,
    required this.minSO2,
  });
}
