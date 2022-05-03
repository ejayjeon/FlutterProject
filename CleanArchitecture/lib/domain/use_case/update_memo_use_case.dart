import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';

class UpdateMemoUseCase {
  final MemoRepository repository;
  UpdateMemoUseCase(this.repository);

  Future<void> call(Memo memo) async {
    await repository.updateMemo(memo);
  }
}
