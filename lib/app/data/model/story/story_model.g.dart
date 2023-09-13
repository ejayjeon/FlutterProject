// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryModel _$$_StoryModelFromJson(Map<String, dynamic> json) =>
    _$_StoryModel(
      index: json['index'] as int?,
      version: json['version'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      writer:
          (json['writer'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isPrivate: json['isPrivate'] as bool,
    );

Map<String, dynamic> _$$_StoryModelToJson(_$_StoryModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'version': instance.version,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'writer': instance.writer,
      'isPrivate': instance.isPrivate,
    };
