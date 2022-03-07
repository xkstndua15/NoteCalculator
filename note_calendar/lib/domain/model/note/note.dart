import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

part 'note.g.dart';

@freezed
class Note with _$Note {
  factory Note({
    String? title,
    required String content,
    required int id,
    required int addTime,
    required int editTime,
    required int color,
    required int fontSize,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
