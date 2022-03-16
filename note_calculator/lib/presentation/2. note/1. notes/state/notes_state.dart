import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_calendar/domain/model/note/note.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required List<Note> notes,
  }) = _NotesState;
}
