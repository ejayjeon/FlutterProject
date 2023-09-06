import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whoever/domain/model/episode_mode.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  factory BookModel({
    int? index, // 책 분류 인덱싱
    required String uuid, // 책 고유 UUID
    required String title, // 책제목
    String? description, // 간략한 소개글
    List<String>? tags, // [ 태그들 ]
    String? imgPath, // 책표지 이미지
    List<String>? writers, // [ 작가 ] // UserModel로 대체
    required bool isPublic, // 기본값 false
    List<EpisodeModel>? episodes, // [ 책 내부 ] 에피소드들

    // NOTE : 별점, 댓글모델 추가
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
