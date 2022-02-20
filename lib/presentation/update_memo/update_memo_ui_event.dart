import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_memo_ui_event.freezed.dart';

// viewModel에서 이벤트 감지
@freezed
class UpdateMemoUiEvent with _$UpdateMemoUiEvent {
  const factory UpdateMemoUiEvent.saveMemo() = SaveMemo;
  const factory UpdateMemoUiEvent.showSnackBar(String message) = ShowSnackBar;
}
