// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination<T> _$PaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Pagination<T>(
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PaginationToJson<T>(
  Pagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data.map(toJsonT).toList(),
    };

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    PaginationMeta(
      count: json['count'] as int,
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$PaginationMetaToJson(PaginationMeta instance) =>
    <String, dynamic>{
      'count': instance.count,
      'hasMore': instance.hasMore,
    };
