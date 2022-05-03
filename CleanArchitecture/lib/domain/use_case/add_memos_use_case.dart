import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';

class AddMemosUseCase {
  final MemoRepository repository;
  AddMemosUseCase(this.repository);

  Future<void> call(Memo memo) async {
    await repository.insertMemo(memo);
  }
}
