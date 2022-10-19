import 'package:nosh/common/const/data.dart';

class DataUtils {
  static String pathToUrl(String value) {
    return 'http://$ip$value';
  }

  static List<String> listPathsToUrls(List<String> value) {
    return value.map((e) => pathToUrl(e)).toList();
  }
}
