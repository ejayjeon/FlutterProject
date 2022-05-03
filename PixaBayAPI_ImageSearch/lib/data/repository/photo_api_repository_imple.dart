import 'package:image_search/data/data_sources/pixabay_api.dart';
import 'package:image_search/data/data_sources/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/models/photo.dart';

class PhotoApiRepositoryImple implements PhotoApiRepository {
  PixabayApi api;
  PhotoApiRepositoryImple(this.api);
  // final api = PixabayApi(client: http.Client());
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);
    // result 타입검사 : freezed -> 타입체크 when
    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
//   Future<Result<List<Photo>>> fetch(String query) async {
//     final Result<Iterable> result = await api.fetch(query);

// // freezed 사용시 if문 처럼 체크
//     return result.when(
//       success: (photos) {
//         return Result.success(photos.map((e) => Photo.fromJson(e)).toList());
//       },
//       error: (message) {
//         return Result.error(message);
//       },
//     );
//   }

}
