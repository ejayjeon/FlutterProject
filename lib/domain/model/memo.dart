import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  factory Memo({
    required String title,
    required String content,
    required int color,
    required int timestamp,
    int? id, // id가 항상 필요한 건 아니다. 그렇기 때문에 required가 아니라 nullable로 처리할 수 있다
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
