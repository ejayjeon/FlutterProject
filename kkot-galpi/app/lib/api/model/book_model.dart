import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  final List<String>? authors; // 저자 (여러 명)
  final List<String>? translators; // 번역가 (여러 명)
  final String? title; // 책 이름
  final String? contents; // 책 소개
  final String? datetime; // 출판일
  final String? isbn; // 국제 표준 도서 번호 (ISBN)
  final int? price; // 가격
  final int? salePrice; // 세일가
  final String? publisher; // 출판사
  final String? status; // 정상판매, 품절
  final String? thumbnail; // 섬네일
  final String? url; // 검색 이동경로
  final Meta? meta; // meta data

  BookModel({
    this.authors,
    this.translators,
    this.title,
    this.contents,
    this.datetime,
    this.isbn,
    this.price,
    this.salePrice,
    this.publisher,
    this.status,
    this.thumbnail,
    this.url,
    this.meta,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

@JsonSerializable()
class Meta {
  final bool isEnd; // 현재 페이지가 마지막 페이지인지 여부
  final int pageableCount; // 중복된 문서를 제외하고 처음부터 요청 페이지까지 노출 가능한 문서
  final int totalCount;

  Meta({
    required this.isEnd,
    required this.pageableCount,
    required this.totalCount,
  }); // 검색된 문서의 수

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
