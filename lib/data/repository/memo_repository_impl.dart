import 'package:jemmemo/data/data_source/memo_db_helper.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';

class MemoRepositoryImpl implements MemoRepository {
  final MemoDbHelper db;
  MemoRepositoryImpl(this.db); // db의 기능을 하겠다는 것을 알려줌

  @override
  Future<void> deleteMemo(Memo memo) async {
    await db.deleteMemo(memo);
  }

  @override
  Future<Memo?> getMemoById(int id) async {
    return await db.getMemoById(id);
  }

  @override
  Future<List<Memo>> getMemos() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertMemo(Memo memo) async {
    await db.insertMemo(memo);
  }

  @override
  Future<void> updateMemo(Memo memo) async {
    await db.updateMemo(memo);
  }
}
