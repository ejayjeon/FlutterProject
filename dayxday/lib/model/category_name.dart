import 'package:drift/drift.dart';

class CategoryName extends Table {
  IntColumn get cateId => integer().autoIncrement()();
  TextColumn get category => text()();
}
