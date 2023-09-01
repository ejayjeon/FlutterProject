import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.g.dart';

part 'note.freezed.dart';

// @JsonSerializable()
// class Note {
//   int id;
//   String? title;
//   String? content;
//   int color;
//   String timestamp; // 시간

//   Note({
//     required this.id,
//     this.title,
//     this.content,
//     this.color = 0xfffff,
//     required this.timestamp,
//   });

//   factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
// }

@freezed
class Note with _$Note {
  factory Note({
    required String title,
    required String content,
    required int color,
    required String timestamp,
    int? id,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
