import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/dio/dio.dart';
import 'package:nosh/common/provider/secure_storage_provider.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();

  dio.interceptors.add(
    CustomInterceptor(
      storage: ref.watch(
        secureStorageProvider,
      ),
    ),
  );
  return dio;
});
