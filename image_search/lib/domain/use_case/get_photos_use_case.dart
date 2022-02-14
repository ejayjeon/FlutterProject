import 'dart:math';

import 'package:image_search/data/data_sources/result.dart';
import 'package:image_search/domain/models/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;
  GetPhotosUseCase(this.repository);
  Future<Result<List<Photo>>> call(String query) async {
    final result = await repository.fetch(query);
    return result.when(success: (photos) {
      return Result.success(photos.sublist(0, min(10, photos.length)));
      // 3하고 photo,length 중에 작은 걸 가져와. -> 이런 식으로 선택을 줄 수 있다
    }, error: (message) {
      return Result.error(message);
    });
  }
}
