// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ko_gpt_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KoGPTResponseModel _$KoGPTResponseModelFromJson(Map<String, dynamic> json) =>
    KoGPTResponseModel(
      json['id'] as String,
      (json['generations'] as List<dynamic>)
          .map((e) => Generations.fromJson(e as Map<String, dynamic>))
          .toList(),
      Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KoGPTResponseModelToJson(KoGPTResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'generations': instance.generations,
      'usage': instance.usage,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      promptTokens: json['promptTokens'] as int?,
      generatedTokens: json['generatedTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'promptTokens': instance.promptTokens,
      'generatedTokens': instance.generatedTokens,
      'totalTokens': instance.totalTokens,
    };

Generations _$GenerationsFromJson(Map<String, dynamic> json) => Generations(
      text: json['text'] as String,
      tokens: json['tokens'] as int,
    );

Map<String, dynamic> _$GenerationsToJson(Generations instance) =>
    <String, dynamic>{
      'text': instance.text,
      'tokens': instance.tokens,
    };
