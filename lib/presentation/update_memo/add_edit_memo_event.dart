import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_memo_event.freezed.dart';

@freezed
abstract class AddEditMemoEvent with _$AddEditMemoEvent {
  // Color (색깔)
  const factory AddEditMemoEvent.changeColor(int color) = ChangeColor;

  // 객체 대신 원시타입을 받아서 메모를 저장
  const factory AddEditMemoEvent.saveMemo(
      int? id, String title, String content) = SaveMemo;
}
