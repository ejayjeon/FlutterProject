import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jemmemo/domain/model/memo.dart';
import 'package:jemmemo/domain/repository/memo_repository.dart';
import 'package:jemmemo/presentation/update_memo/add_edit_memo_event.dart';
import 'package:jemmemo/presentation/update_memo/update_memo_ui_event.dart';
import 'package:jemmemo/ui/colors.dart';

class UpdateMemoViewModel with ChangeNotifier {
  // usecase 사용전
  final MemoRepository repository;
  // 예시로 color가 만약 amber라면? -> int 값이기 때문에 value
  int _color = roseBud.value;
  int get color => _color;
  final _eventCtrl = StreamController<UpdateMemoUiEvent>.broadcast();
  // 여러 번 listen 가능
  Stream<UpdateMemoUiEvent> get eventStream => _eventCtrl.stream;

  UpdateMemoViewModel(this.repository);

// onEvent만 호출
  void onEvent(AddEditMemoEvent event) {
    event.when(
      changeColor: _changeColor,
      saveMemo: _saveMemo,
    );
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveMemo(int? id, String title, String content) async {
    if (title.isEmpty || content.isEmpty) {
      _eventCtrl.add(UpdateMemoUiEvent.showSnackBar('내용이 비어있습니다.'));
      return;
    }
    if (id == null) {
      repository.insertMemo(
        Memo(
            title: title,
            content: content,
            color: _color,
            timestamp: DateTime.now().microsecondsSinceEpoch),
      );
    } else {
      // id가 null이 아닐 경우
      await repository.updateMemo(
        Memo(
          id: id,
          title: title,
          content: content,
          color: _color,
          timestamp: DateTime.now().microsecondsSinceEpoch,
        ),
      );
    }
    _eventCtrl.add(UpdateMemoUiEvent.saveMemo());
    notifyListeners();
  }
}
