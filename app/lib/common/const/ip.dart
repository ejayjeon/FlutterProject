import 'dart:io';

final aosIp = '10.0.0.2:3000';
final iosIp = '127.0.0.1:3000';

final ip = Platform.isIOS ? iosIp : aosIp;
final path = 'http://$ip';
