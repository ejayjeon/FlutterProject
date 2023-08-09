// [기본 상태]
import 'package:json_annotation/json_annotation.dart';

part 'ko_gpt_response_model.g.dart';

abstract class KoGPTResponseBase {}

// [에러 상태]
class KoGPTResponseError extends KoGPTResponseBase {
  final String message;

  KoGPTResponseError({
    required this.message,
  });
}

// [데이터 받아 오는 상태]
class KoGPTResponseLoading extends KoGPTResponseBase {}

// [모델]
@JsonSerializable()
class KoGPTResponseModel extends KoGPTResponseBase {
  final String id;
  final List<Generations> generations;
  final Usage usage;

  KoGPTResponseModel(this.id, this.generations, this.usage);
}

@JsonSerializable()
class Usage {
  final int? promptTokens;
  final int? generatedTokens;
  final int? totalTokens;

  Usage({
    this.promptTokens,
    this.generatedTokens,
    this.totalTokens,
  });

  Usage copyWith({
    int? promptTokens,
    int? generatedTokens,
    int? totalTokens,
  }) {
    return Usage(
      promptTokens: promptTokens ?? this.promptTokens,
      generatedTokens: generatedTokens ?? this.generatedTokens,
      totalTokens: totalTokens ?? this.totalTokens,
    );
  }

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}

@JsonSerializable()
class Generations {
  final String text;
  final int tokens;

  Generations({
    required this.text,
    required this.tokens,
  });

  factory Generations.fromJson(Map<String, dynamic> json) =>
      _$GenerationsFromJson(json);
}
