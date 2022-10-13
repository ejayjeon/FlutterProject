import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // 1. 프로바이더가 추가되었을 때
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    return print('[Provide Added] what? $provider / value? $value');
  }

// 2. 프로바이더가 업데이트 되었을 때
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    return print(
        '[Provide Updated] what? $provider / old? $previousValue / new? $newValue');
  }

// 3. 프로바이더가 제거되었을 때
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    return print('[Provide disposed] what? $provider');
  }
}
