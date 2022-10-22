import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/provider/dio_provider.dart';
import 'package:nosh/restaurant/repository/restaurant_rating_repository.dart';

final restaurantRatingRepositoryProvider =
// URL에서 어떤 레스토랑을 지정할 건 받ㅣ 위서
    Provider.family<RestaurantRatingRepository, String>(
  (ref, id) {
    final dio = ref.watch(dioProvider);
    final repository = RestaurantRatingRepository(dio,
        baseUrl: 'http://$ip/restaurant/$id/rating');
    return repository;
  },
);
