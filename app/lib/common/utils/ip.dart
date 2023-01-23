// localhost
import 'dart:io';

final emulatorIp = '10.0.2.2:3000';
final simulatorIp = '127.0.0.1:3000';

final ip = Platform.isIOS ? simulatorIp : emulatorIp;

class IP {
  static String pathToUrl(String value) {
    return 'http://$ip:$value';
  }

  static List<String> listPathsToUrl(List paths) {
    return paths.map((e) => pathToUrl(e)).toList();
  }
}
