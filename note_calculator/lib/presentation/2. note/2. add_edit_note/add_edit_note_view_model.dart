import 'package:flutter/material.dart';
import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/domain/use_case/note_use_case/note_use_cases.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/event/add_edit_note_event.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/state/add_edit_note_state.dart';
import 'package:note_calendar/ui/color.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteUseCases useCases;

  AddEditNoteViewModel(this.useCases);

  AddEditNoteState _state =
      AddEditNoteState(color: red.value, fontSize: 14, editMode: false);

  AddEditNoteState get state => _state;

  void onEvent(AddEditNoteEvent event) {
    event.when(
      saveNote: _saveNote,
      changeColor: _changeColor,
      changeFontSize: _changeFontSize,
      setUsedNote: _setUsedNote,
    );
  }

  Future<void> _saveNote(
      int? id, String? title, String content, int color, int fontSize) async {
    if ((title == null || title.isEmpty) && content.isEmpty) {
      return;
    }

    if (title == null || title.isEmpty) {
      String nullTitle;

      if (content.length < 10) {
        nullTitle = content.substring(0, content.length);
      } else {
        nullTitle = content.substring(0, 9);
      }
      _state = state.copyWith(title: nullTitle);
    } else {
      _state = state.copyWith(title: title);
    }

    if (id == null) {
      await useCases.addNoteUseCase(Note(
          title: _state.title!,
          content: content,
          color: color,
          fontSize: fontSize,
          addTime: DateTime.now().millisecondsSinceEpoch,
          editTime: DateTime.now().millisecondsSinceEpoch));
    } else {
      await useCases.updateNoteUseCase(Note(
        id: id,
        title: _state.title!,
        content: content,
        color: color,
        fontSize: fontSize,
        editTime: DateTime.now().millisecondsSinceEpoch,
      ));
    }
  }

  void _changeColor(int color) {
    _state = state.copyWith(color: color);
    notifyListeners();
  }

  void _changeFontSize(int fontSize) {
    _state = state.copyWith(fontSize: fontSize);
    notifyListeners();
  }

  void changeEditMode() {
    _state = state.copyWith(editMode: !_state.editMode);
    notifyListeners();
  }

  void _setUsedNote(int color, int fontSize) {
    _state = state.copyWith(color: color, fontSize: fontSize);
  }
}
