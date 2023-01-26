// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      translators: (json['translators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      contents: json['contents'] as String?,
      datetime: json['datetime'] as String?,
      isbn: json['isbn'] as String?,
      price: json['price'] as int?,
      salePrice: json['salePrice'] as int?,
      publisher: json['publisher'] as String?,
      status: json['status'] as String?,
      thumbnail: json['thumbnail'] as String?,
      url: json['url'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'authors': instance.authors,
      'translators': instance.translators,
      'title': instance.title,
      'contents': instance.contents,
      'datetime': instance.datetime,
      'isbn': instance.isbn,
      'price': instance.price,
      'salePrice': instance.salePrice,
      'publisher': instance.publisher,
      'status': instance.status,
      'thumbnail': instance.thumbnail,
      'url': instance.url,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      isEnd: json['isEnd'] as bool,
      pageableCount: json['pageableCount'] as int,
      totalCount: json['totalCount'] as int,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'isEnd': instance.isEnd,
      'pageableCount': instance.pageableCount,
      'totalCount': instance.totalCount,
    };
