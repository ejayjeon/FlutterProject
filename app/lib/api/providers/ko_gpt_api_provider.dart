import 'dart:convert';

import 'package:app/api/model/ko_gpt_response_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final koGPTProvider = StateNotifierProvider<KoGPTNotifier, KoGPTResponseBase>(
  (ref) {
    return KoGPTNotifier();
  },
);

// id: '',
// generations: [{ test: '', tokens: '' }, ...],
// usage: {prompt_tokens: 0, generated_tokens: 0, total_tokens: 0},
class KoGPTNotifier extends StateNotifier<KoGPTResponseBase> {
  final KoGPTResponseModel? model;
  KoGPTNotifier({
    this.model,
  }) : super(KoGPTResponseLoading()) {
    //
  }

// [API 호출]
  Future<void> koGPTApi({
    String? prompt,
    int? maxTokens = 1,
    double? temperature = 1.0,
    double? topP = 1.0,
    int? n = 1,
  }) async {
    final path = 'https://api.kakaobrain.com/v1/inference/kogpt/generation/';
    final req = await Dio().post(
      path,
      data: {
        'prompt': prompt,
        'max_tokens': maxTokens,
        'temperature': temperature,
        'top_p': topP,
        'n': n,
      },
      options: Options(
        headers: {
          'Authorization': 'KakaoAK${dotenv.get('KAKAO_REST_API_KEY')}',
          'Content-Type': 'application/json'
        },
      ),
    );
    print('[req] $req');
  }
}
