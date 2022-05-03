// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memo _$$_MemoFromJson(Map<String, dynamic> json) => _$_Memo(
      title: json['title'] as String,
      content: json['content'] as String,
      color: json['color'] as int,
      timestamp: json['timestamp'] as int,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_MemoToJson(_$_Memo instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'color': instance.color,
      'timestamp': instance.timestamp,
      'id': instance.id,
    };
