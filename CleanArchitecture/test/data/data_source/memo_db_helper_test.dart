import 'package:flutter_test/flutter_test.dart';
import 'package:jemmemo/data/data_source/memo_db_helper.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test', () async {
    // 메모리 상에다가 임시로 db를 생성해서 db를 테스트함 : db test code 작성 코드
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    // 테이블이 없는 상태 -> memo Model을 본따서 SQL 문 생성
    await db.execute(
        'CREATE TABLE memo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    //sqllite3 : NULL, INTEGER, REAL, TEXT, BLOB
    final memoDbHelper = MemoDbHelper(db);
    await memoDbHelper.insertMemo(Memo(
      title: 'test',
      content: 'test',
      color: 1,
      timestamp: 1,
    ));
    // 데이터 검사
    expect((await memoDbHelper.getNotes()).length, 1);

    // getMemoById가 nullable 을 return -> null이 아님을 보증 -> !
    Memo memo = (await memoDbHelper.getMemoById(1))!;
    expect(memo.id, 1);

    // update 내용을 만들어준다
    // memo.title = 'change'; -> freezed 불변객체로 생성해서 안됨
    await memoDbHelper.updateMemo(memo.copyWith(
      title: 'change',
      content: 'change',
    ));

    memo = (await memoDbHelper.getMemoById(1))!;
    expect(memo.title, 'change');

    // delete 데이터 테스트
    await memoDbHelper.deleteMemo(memo);
    expect((await memoDbHelper.getNotes()).length, 0);

    await db.close();
  });
}
