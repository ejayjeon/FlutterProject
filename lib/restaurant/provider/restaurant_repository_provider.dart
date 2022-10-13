import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/provider/dio_provider.dart';
import 'package:nosh/restaurant/repository/restaurant_repository.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>(
  (ref) {
    // 프로바이더 안에서는 변경이 있을 것을 대비해서 watch
    final dio = ref.watch(dioProvider);
    final repository =
        RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');
    return repository;
  },
);
