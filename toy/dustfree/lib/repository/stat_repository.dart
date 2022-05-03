import 'package:dio/dio.dart';
import 'package:dustfree/const/data.dart';
import 'package:dustfree/model/stat_model.dart';
// 데이터를 가져와야할 때 StatRepository만 실행하면 언제 어디서든 List 형태의 fetchData를 가져올 수 있음

class StatRepository {
  // 함수를 . 뒤에서 바로 실행할 수 있기 때문에 Static으로 씀
  // List 형태의 StatModel을 리턴해줄 fetchData라는 메소드를 생성
  static Future<List<StatModel>> fetchData({
    required ItemCode itemCode, // 외부에서 받아오는 값
  }) async {
    final response = await Dio().get(
      // 요청 url
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      // QueryParam
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
        'numOfRows': 30,
        'pageNo': 1,
        'itemCode': itemCode.name,
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK'
      },
    );
    return response.data['response']['body']['items']
        .map<StatModel>(
          (item) => StatModel.fromJson(json: item),
        )
        .toList();
  }
}
