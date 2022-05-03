import 'package:jemmemo/domain/model/memo.dart';
import 'package:sqflite/sqlite_api.dart';

// SQL helper
class MemoDbHelper {
  // 실제 데이터를 가지고 오는 부분
  Database db;
  MemoDbHelper(this.db);

// Id를 통해서 ID를 가지고 오는 기능
  Future<Memo?> getMemoById(int id) async {
    // 1. db 객체 접근
    final List<Map<String, dynamic>> maps = await db.query(
      'memo', // 접근 객체
      where: 'id = ?', // 조건 설정
      whereArgs: [id], // list로 ?에 들어갈 값을 세팅
      // memo의 id가 파라미터로 지정된 id로 지정이 되면서 이 값이 sql문 where절에 해당
      // SELECT * FROM memo WHERE id = ?
    );
    // 만약에 이 값 maps -> 1개가 들어있다 / 비어있지 않다면 -> 값 1개를 가져와 리턴
    if (maps.isNotEmpty) {
      return Memo.fromJson(maps.first);
    }
    return null;
  }

// 모든 Memo를 가져오는 쿼리
  Future<List<Memo>> getNotes() async {
    final maps = await db.query('memo'); // 조건 없이 설정 : 모든 memo 다 가지고 올 것
    return maps.map((e) => Memo.fromJson(e)).toList();
  }

  // Memo를 추가하는 법
  Future<int> insertMemo(Memo memo) async {
    int id = await db.insert('memo', memo.toJson()); // insert(어디에, 무엇을)
    return id;
  }

  // Memo Update
  Future<int> updateMemo(Memo memo) async {
    int id = await db.update('memo', memo.toJson(),
        where: 'id = ?', whereArgs: [memo.id]); // update
    return id;
  }

// delete Memo
  Future<int> deleteMemo(Memo memo) async {
    int id = await db.delete('memo', where: 'id = ?', whereArgs: [memo.id]);
    return id;
  }
}
