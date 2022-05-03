import 'package:flutter_test/flutter_test.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';
import 'package:jemmemo/domain/use_case/get_memos_use_case.dart';
import 'package:jemmemo/domain/util/memo_order.dart';
import 'package:jemmemo/domain/util/order_type.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_memos_use_case.mocks.dart';

@GenerateMocks([MemoRepository])
void main() {
  test('정렬 기능이 잘 동작해야 한다', () async {
    final repository = MockMemoRepository();
    final getMemos = GetMemosUseCase(repository);

    // fakedate : 동작 정의
    when(repository.getMemos()).thenAnswer((_) async => [
          Memo(title: 'title', content: 'content', timestamp: 0, color: 1),
          Memo(title: 'title2', content: 'content2', timestamp: 1, color: 2),
        ]);
    List<Memo> result = await getMemos(MemoOrder.date(OrderType.descending()));
    expect(result, isA<List<Memo>>);
    expect(result.first.timestamp, 2);
    verify(repository.getMemos());

    result = await getMemos(MemoOrder.date(OrderType.ascending()));
    expect(result.first.timestamp, 0);
    verify(repository.getMemos());

    result = await getMemos(MemoOrder.title(OrderType.ascending()));
    expect(result.first.title, 'title');
    verify(repository.getMemos());

    result = await getMemos(MemoOrder.title(OrderType.descending()));
    expect(result.first.title, 'title2');
    verify(repository.getMemos());

    result = await getMemos(MemoOrder.color(OrderType.ascending()));
    expect(result.first.color, 1);
    verify(repository.getMemos());

    result = await getMemos(MemoOrder.color(OrderType.descending()));
    expect(result.first.color, 2);
    verify(repository.getMemos());

    verifyNoMoreInteractions(repository);
  });
}
