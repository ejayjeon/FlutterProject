import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class StoryModel with _$StoryModel {
  factory StoryModel({
    String? title,
    String? content, // HTML로 변환
    required DateTime createDate,
    DateTime? updateDate,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}
