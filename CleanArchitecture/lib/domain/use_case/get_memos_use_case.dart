import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';
import 'package:jemmemo/domain/util/memo_order.dart';

class GetMemosUseCase {
  // 모든 클래스가 가지고 있는 call() 메소드를 재정의
  final MemoRepository repository;
  GetMemosUseCase(this.repository);

  Future<List<Memo>> call(MemoOrder memoOrder) async {
    List<Memo> memos = await repository.getMemos();
    memoOrder.when(title: (orderType) {
      orderType.when(
        ascending: () {
          memos.sort((a, b) => a.title.compareTo(b.title));
        },
        descending: () {
          memos.sort((a, b) => -a.title.compareTo(b.title));
        },
      );
    }, date: (orderType) {
      orderType.when(
        ascending: () {
          memos.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        },
        descending: () {
          memos.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
        },
      );
    }, color: (orderType) {
      orderType.when(
        ascending: () {
          memos.sort((a, b) => a.color.compareTo(b.color));
        },
        descending: () {
          memos.sort((a, b) => -a.color.compareTo(b.color));
        },
      );
    });

    return memos;
  }
}
