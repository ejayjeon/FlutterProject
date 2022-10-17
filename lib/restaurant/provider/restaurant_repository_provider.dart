import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/provider/dio_provider.dart';
import 'package:nosh/restaurant/repository/restaurant_repository.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    final repository =
        RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');
    return repository;
  },
);
