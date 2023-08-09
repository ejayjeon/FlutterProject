import 'package:app/common/const/ip.dart';
import 'package:flutter/material.dart';

class ScriptModel {
  final Widget image; // 이미지
  final String title; // 제목
  final String description; // 소개
  final List<String> tags; // 관련 태그들
  final bool isShared; // false: Private, true: public
  final int sharerCount; // 공유자 수 : 기본 1
  final int favCount; // 좋아요 수

  ScriptModel({
    required this.image,
    required this.title,
    required this.description,
    required this.tags,
    required this.isShared,
    required this.sharerCount,
    required this.favCount,
  });

  factory ScriptModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return ScriptModel(
      image: Image.network('http://$ip${json['image']}'),
      title: json['title'],
      description: json['description'],
      tags: List.from(json['tags']),
      isShared: json['isShared'],
      sharerCount: json['sharerCount'],
      favCount: json['favCount'],
    );
  }
}
