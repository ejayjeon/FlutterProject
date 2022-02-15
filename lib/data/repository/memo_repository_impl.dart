import 'package:jemmemo/data/data_resource/memo_db.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';

class MemoRepositoryImpl implements MemoRepository {
  final MemoDb db;
  MemoRepositoryImpl(this.db); // db의 기능을 하겠다는 것을 알려줌

  @override
  Future<void> deleteMemo(Memo memo) {
    // TODO: implement deleteMemo
    throw UnimplementedError();
  }

  @override
  Future<Memo> getMemoById(int id) {
    // TODO: implement getMemoById
    throw UnimplementedError();
  }

  @override
  Future<List<Memo>> getMemos() {
    // TODO: implement getMemos
    throw UnimplementedError();
  }

  @override
  Future<void> insertMemo(Memo memo) {
    // TODO: implement insertMemo
    throw UnimplementedError();
  }

  @override
  Future<void> updateMemo(Memo memo) {
    // TODO: implement updateMemo
    throw UnimplementedError();
  }
}
