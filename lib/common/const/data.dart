import 'dart:io';

// 안드로이드 에뮬과 시뮬 path는 다르다 별도로 설정해 주어야 함
const emulatorIp = '10.0.2.2:3000';
const simulatorIp = '127.0.0.1:3000';
// IOS 와 Android 구분하는 방법
final ip = Platform.isIOS ? simulatorIp : emulatorIp;

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN_KEY';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN_KEY';
