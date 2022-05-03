import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';

class DeleteMemoUseCase {
  // 따로 return은 존재하지 않으며, 삭제할 memo를 인자로 받는다
  final MemoRepository repository; // Memo를 다루려면 MemoRepository가 필요해
  DeleteMemoUseCase(this.repository);

  // 정렬 기능까지 하기 위해서 사전에 Use_Case 사용
  Future<void> call(Memo memo) async {
    await repository.deleteMemo(memo);
  }
}
