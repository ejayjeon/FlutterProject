import 'package:flutter/material.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/use_case/use_cases.dart';
import 'package:jemmemo/domain/util/memo_order.dart';
import 'package:jemmemo/domain/util/order_type.dart';
import 'package:jemmemo/presentation/memo/memo_event.dart';
import 'package:jemmemo/presentation/memo/memo_state.dart';

// Provider 활용할 것  -> changeNotifier
class MemoViewModel with ChangeNotifier {
// Use_case가 없다고 친다면 : 모든 기능들을 view에 지정해야됨
  // final MemoRepository repository;
  final UseCases useCases;

  MemoState _state = MemoState(
      memos: [],
      memoOrder: MemoOrder.date(OrderType.descending()),
      isOrderSectionVisible: false);
  MemoState get state => _state;

  // List<Memo> _memos = [];
  // UnmodifiableListView<Memo> get memo => UnmodifiableListView(_memos);

  Memo? _recentDeleteMemo;

  MemoViewModel(this.useCases) {
    _loadMemos();
  }
  // 업데이트 event 쪽을 업데이트하지 않았더니 업데이트가 되지 않았음
  void onEvent(MemoEvent event) {
    event.when(
        loadMemos: _loadMemos,
        deleteMemo: _deleteMemo,
        undoMemo: _undoMemo,
        changeOrder: (MemoOrder memoOrder) {
          _state = state.copyWith(memoOrder: memoOrder);
          _loadMemos();
        },
        toggleOrderSection: () {
          _state = state.copyWith(
              isOrderSectionVisible: !state.isOrderSectionVisible);
          notifyListeners();
        });
  }

  Future<void> _loadMemos() async {
    List<Memo> memos = await useCases.getMemosUseCase(state.memoOrder);
    // 정렬에 대한 기준이 변경이 되어야 함
    // memos.sort(
    //     (a, b) => -a.timestamp.compareTo(b.timestamp)); // compareTo : 오름차순
    _state = state.copyWith(memos: memos); // 상태가 여러 개가 있을 때 교체?
    notifyListeners();
  }

  Future<void> _deleteMemo(Memo memo) async {
    await useCases.deleteMemoUseCase(memo);
    _recentDeleteMemo = memo;
    await _loadMemos();
  }

  Future<void> _undoMemo() async {
    // 삭제된 memo가 null이 아니라면, repository에 memo를 insert
    if (_recentDeleteMemo != null) {
      await useCases.addMemosUseCase(_recentDeleteMemo!);
      _recentDeleteMemo = null; // _recentDeleteMemo는 비워줌

      _loadMemos();
    }
  }
}
