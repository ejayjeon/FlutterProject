import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/model/status_model.dart';

class StatandStatusModel {
  final ItemCode itemCode;
  final StatModel stat;
  final StatusModel status;

  StatandStatusModel(
      {required this.itemCode, required this.stat, required this.status});
}
