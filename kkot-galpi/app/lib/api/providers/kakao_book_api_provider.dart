import 'package:app/api/model/book_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final kakaoBookApiProvider = Provider<KakaoBookApi>((ref) {
  final dio = ref.read(dioProvider);
  return KakaoBookApi(dio: dio);
});

class KakaoBookApi {
  final Dio dio;
  BookModel model = BookModel();
  final DotEnv dotEnv = DotEnv();

  KakaoBookApi({
    required this.dio,
  });

  // [GET /Book Search]
  Future getBookList(String title) async {
    // final path = dotEnv.get('KAKAO_BOOK_API');
    final path = 'https://dapi.kakao.com/v3/search/book';
    final res = await dio.get(
      path,
      options: Options(
        headers: {
          'Authorization': 'KakaoAK fc3cb69accf94cfe177a4b789bcb629f',
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Access-Control-Allow-Credentials': true,
          'Header-set-Referrer-Policy': 'no-referrer-when-downgrade',
        },
      ),
      queryParameters: {
        'query': title,
      },
    );
    print('[res] ${res.data}');
    return res.data;
  }
}
