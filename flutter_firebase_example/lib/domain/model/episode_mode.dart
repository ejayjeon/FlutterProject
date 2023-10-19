import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whoever/domain/model/story_model.dart';

part 'episode_mode.freezed.dart';
part 'episode_mode.g.dart';

@freezed
class EpisodeModel with _$EpisodeModel {
  factory EpisodeModel({
    required int index, // 기 승 전 결 인덱싱
    required String title, // 에피소드 타이틀
    List<StoryModel>? stories, // 포함된 스토리들
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);
}
