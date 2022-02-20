import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';

class GetMemoUseCase {
  final MemoRepository repository;
  GetMemoUseCase(this.repository);

// Memo를 받을 건데, 없을 수도 있으니까 Nullable인 Memo?로 표기해준다
  Future<List<Memo>> call() async {
    // 정렬 조건들을 여기에다가 작성
    List<Memo> memos = await repository.getMemos();
    memos.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
    return memos;
  }
}
