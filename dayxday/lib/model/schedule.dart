import 'package:drift/drift.dart';

class Schedules extends Table {
  // PRIMARY KEY
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();

  // Category Color Table ID
  IntColumn get colorId => integer()();
  IntColumn get cateId => integer()();
  DateTimeColumn get createAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
