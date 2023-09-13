import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_model.g.dart';
part 'story_model.freezed.dart';

@freezed
class StoryModel with _$StoryModel {
  factory StoryModel({
    int? index, // auto-increment
    required String version, // ex 1.3.14 ...
    required String title,
    required String content,
    required DateTime createdAt,
    DateTime? updatedAt,
    List<String>? writer,
    required bool isPrivate,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}
