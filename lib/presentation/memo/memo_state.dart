import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/util/memo_order.dart';

part 'memo_state.freezed.dart';

@freezed
class MemoState with _$MemoState {
  factory MemoState({
    required List<Memo> memos, // default 값으로 쓰기 위해 / required를 사용할 수 있음
    required MemoOrder memoOrder,
    required bool isOrderSectionVisible,
  }) = _MemoState;
}
