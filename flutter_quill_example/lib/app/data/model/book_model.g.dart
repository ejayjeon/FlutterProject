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
      bookImage: json['bookImage'] as String?,
      creators: (json['creators'] as List<dynamic>?)
          ?.map((e) => BookCreator.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: BookCategory.fromJson(json['category'] as Map<String, dynamic>),
      version: json['version'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => BookEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPrivate: json['isPrivate'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_BookModelToJson(_$_BookModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'bookImage': instance.bookImage,
      'creators': instance.creators,
      'tags': instance.tags,
      'category': instance.category,
      'version': instance.version,
      'episodes': instance.episodes,
      'isPrivate': instance.isPrivate,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_BookCreator _$$_BookCreatorFromJson(Map<String, dynamic> json) =>
    _$_BookCreator(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      isOriginCreator: json['isOriginCreator'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_BookCreatorToJson(_$_BookCreator instance) =>
    <String, dynamic>{
      'user': instance.user,
      'isOriginCreator': instance.isOriginCreator,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_BookEpisode _$$_BookEpisodeFromJson(Map<String, dynamic> json) =>
    _$_BookEpisode(
      index: json['index'] as int?,
      title: json['title'] as String,
      stories: (json['stories'] as List<dynamic>?)
          ?.map((e) => BookStory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPrivate: json['isPrivate'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_BookEpisodeToJson(_$_BookEpisode instance) =>
    <String, dynamic>{
      'index': instance.index,
      'title': instance.title,
      'stories': instance.stories,
      'isPrivate': instance.isPrivate,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_BookStory _$$_BookStoryFromJson(Map<String, dynamic> json) => _$_BookStory(
      index: json['index'] as int?,
      title: json['title'] as String,
      content: json['content'] as String,
      imagePath: json['imagePath'] as String?,
      isPrivate: json['isPrivate'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_BookStoryToJson(_$_BookStory instance) =>
    <String, dynamic>{
      'index': instance.index,
      'title': instance.title,
      'content': instance.content,
      'imagePath': instance.imagePath,
      'isPrivate': instance.isPrivate,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_BookCategory _$$_BookCategoryFromJson(Map<String, dynamic> json) =>
    _$_BookCategory(
      index: json['index'] as int,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_BookCategoryToJson(_$_BookCategory instance) =>
    <String, dynamic>{
      'index': instance.index,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
