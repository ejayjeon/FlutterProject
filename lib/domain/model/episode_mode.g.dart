// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeModel _$$_EpisodeModelFromJson(Map<String, dynamic> json) =>
    _$_EpisodeModel(
      index: json['index'] as int,
      title: json['title'] as String,
      stories: (json['stories'] as List<dynamic>?)
          ?.map((e) => StoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EpisodeModelToJson(_$_EpisodeModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'title': instance.title,
      'stories': instance.stories,
    };
