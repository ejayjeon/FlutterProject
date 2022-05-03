import 'package:drift/drift.dart';

class CategoryColors extends Table {
  IntColumn get colorId => integer().autoIncrement()();
  TextColumn get hexCode => text()();
}
