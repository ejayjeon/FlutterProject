import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whoever/app/model/user_model.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

// BookStory -> BookEpisode -> BookModel
// BookCreator -> BookModel
// BookCategory -> BookModel

@freezed
class BookModel with _$BookModel {
  factory BookModel({
    int? index, // sorting을 위한 index, auto increment
    required String uuid, // uuid 자동으로 부여
    required String title, // 책 제목
    String? description, // 책 소개 글
    String? bookImage, // 책 이미지, 없을시 default image
    List<BookCreator>? creators, // 책 작가, 1명: ['BookCreator']
    List<String>? tags, // 책 태그
    required BookCategory category, // 카테고리, 반드시 1개
    String? version, // '1.38.72' : 1명, 38개 에피소드, 72번 수정
    List<BookEpisode>? episodes, // dpisode 가 없으면 default
    required bool isPrivate, // 책 공개 여부
    required DateTime createdAt, // 최초 생성일
    DateTime? updatedAt, // 마지막 업데이트일
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

// -------------------------------------------------

@freezed
class BookCreator with _$BookCreator {
  factory BookCreator({
    required UserModel user, // 유저 모델로 판별
    required bool isOriginCreator, // 원작자인지 여부
    required DateTime createdAt, // JoinDate
    DateTime? updatedAt, //  마지막 업데이트일
  }) = _BookCreator;

  factory BookCreator.fromJson(Map<String, dynamic> json) =>
      _$BookCreatorFromJson(json);
}

// -------------------------------------------------

@freezed
class BookEpisode with _$BookEpisode {
  factory BookEpisode({
    int? index, // 정렬을 위한 index, 없을 시 자동 부여
    required String title, // 에피소드 제목
    List<BookStory>? stories, // Story 가 없을 수도 있음
    required bool isPrivate, // 공개여부
    required DateTime createdAt, // 최초생성일
    DateTime? updatedAt, // 마지막 업데이트일
  }) = _BookEpisode;

  factory BookEpisode.fromJson(Map<String, dynamic> json) =>
      _$BookEpisodeFromJson(json);
}

// -------------------------------------------------

@freezed
class BookStory with _$BookStory {
  factory BookStory({
    int? index, // 정렬을 위한 index, 없을 시 자동 부여
    required String title, // 스토리 제목
    required String content, // 스토리 내용 (html로 변경)
    String? imagePath, // 내용에 포함될 이미지 (html로 변경 시 필요없음)
    required bool isPrivate, // 스토리 공개 여부
    required DateTime createdAt, // 최초 생성일
    DateTime? updatedAt, // 마지막 업데이트일
  }) = _BookStory;

  factory BookStory.fromJson(Map<String, dynamic> json) =>
      _$BookStoryFromJson(json);
}

// -------------------------------------------------

@freezed
class BookCategory with _$BookCategory {
  factory BookCategory({
    required int index, // 카테고리 인덱스
    required String title, // 카테고리 타이틀
    required DateTime createdAt, // 카테고리 최초 생성일
    DateTime? updatedAt, // 카테고리 마지막 업데이트일
  }) = _BookCategory;

  factory BookCategory.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryFromJson(json);
}
