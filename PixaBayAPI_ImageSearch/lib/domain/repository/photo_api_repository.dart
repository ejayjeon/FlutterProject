// PixaBayAPI 가 잘못된다면 전체 코드에 문제가 생길 수 있기 때문에, 인터페이스만 남기고 따로 분리해준다
import 'package:image_search/data/data_sources/result.dart';
import 'package:image_search/domain/models/photo.dart';

abstract class PhotoApiRepository {
  // 인터페이스
  Future<Result<List<Photo>>> fetch(String query);
}
