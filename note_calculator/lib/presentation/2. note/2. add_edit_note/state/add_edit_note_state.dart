import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_state.freezed.dart';

@freezed
class AddEditNoteState with _$AddEditNoteState {
  factory AddEditNoteState({
    String? title,
    String? content,
    required bool editMode,
    required int color,
    required int fontSize,
  }) = _AddEditNoteState;
}
