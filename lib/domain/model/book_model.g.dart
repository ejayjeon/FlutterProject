// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookModel _$$_BookModelFromJson(Map<String, dynamic> json) => _$_BookModel(
      index: json['index'] as int?,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imgPath: json['imgPath'] as String?,
      writers:
          (json['writers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isPublic: json['isPublic'] as bool,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookModelToJson(_$_BookModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'imgPath': instance.imgPath,
      'writers': instance.writers,
      'isPublic': instance.isPublic,
      'episodes': instance.episodes,
    };
