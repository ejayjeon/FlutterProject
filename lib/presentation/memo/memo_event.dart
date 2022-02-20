// memo 화면에서 발생할 모든 event

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/util/memo_order.dart';

part 'memo_event.freezed.dart';

@freezed
// 봉인클래스 : enum과 다른 점 -> 데이터를 받을 수 있음
abstract class MemoEvent with _$MemoEvent {
  // memo를 불러올 수 있음
  const factory MemoEvent.loadMemos() = LoadMemos;
  // 메모를 지울 수 있음
  const factory MemoEvent.deleteMemo(Memo memo) = DeleteMemo;
  // 메모를 지운 후 undo note
  const factory MemoEvent.undoMemo() = UndoMemo;
  const factory MemoEvent.changeOrder(MemoOrder memoOrder) = ChangeOrder;
  const factory MemoEvent.toggleOrderSection() = ToggleOrderSection;
}
