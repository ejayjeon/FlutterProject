import 'dart:io';

import 'package:dayxday/model/category_colors.dart';
import 'package:dayxday/model/category_name.dart';
import 'package:dayxday/model/schedule.dart';
import 'package:dayxday/model/scheduleWithCate.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// 1. private 값까지 불러오기 -> build
part 'drift_db.g.dart';

// 2. Drift 데코레이터 사용해서 테이블 지정
@DriftDatabase(
  tables: [
    // 테이블들로 인식
    Schedules,
    CategoryColors,
    CategoryName,
  ],
)
class LocalDb extends _$LocalDb {
  // 연결을 열어줌
  LocalDb() : super(_openConnection());

// Insert Schedule table
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

// Insert Color table

  Future<int> createCategoryColors(CategoryColorsCompanion data) =>
      into(categoryColors).insert(data);

// Insert Category table
  Future<int> createCategoryName(CategoryNameCompanion data) =>
      into(categoryName).insert(data);

  // select
  Future<List<CategoryNameData>> getCategoryName() =>
      select(categoryName).get();

  // 스케줄 값을 업데이트 될 때마다 지속적으로 Stream으로 받음
  // 쿼리에서 where문을 날려서 애초부터 데이터를 적게 불러옴

  // Delete
// schedules 테이블의 모든 row 삭제 go()
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  // Update Query
  Future<int> updateScheduleById(int id, SchedulesCompanion data) =>
      (update(schedules)..where((tbl) => tbl.id.equals(id))).write(data);

// 특정 스케줄을 받는 Query
  Future<Schedule> getScheduleById(int id) =>
      (select(schedules)..where((tbl) => tbl.id.equals(id))).getSingle();

  Stream<List<ScheduleWithCate>> watchSchedules(DateTime date) {
    final query = select(schedules).join([
      // 조인한 클래스
      innerJoin(categoryName, categoryName.cateId.equalsExp(schedules.cateId))
    ]);
    // 조인을 하면 where문을 바꿔야돼
    query.where(
      (schedules.date.equals(date)),
    );
    query.orderBy([
      OrderingTerm.asc(schedules.startTime),
    ]);
    return query.watch().map((rows) => rows
        .map(
          (row) => ScheduleWithCate(
            schedule: row.readTable(schedules),
            categoryName: row.readTable(categoryName),
          ),
        )
        .toList());

    // return (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();
  }

// .. 함수는 실행되는데 함수가 실행되는 대상이 리턴이 됨 -> select 한 대상이 watch() 되는 것임

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}

// db.sqlite 안에다가 테이블과 파일들을 생성하게 됨
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    // 실제 경로까지 진입해서, db.sqlite 라는 파일을 저장함
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
