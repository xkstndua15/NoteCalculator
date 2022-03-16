import 'package:flutter/material.dart';
import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/domain/use_case/note_use_case/note_use_cases.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/event/add_edit_note_event.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/state/add_edit_note_state.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteUseCases useCases;

  AddEditNoteViewModel(this.useCases);

  AddEditNoteState _state = AddEditNoteState(color: 0, fontSize: 12);

  AddEditNoteState get state => _state;

  void onEvent(AddEditNoteEvent event) {
    event.when(
      saveNote: _saveNote,
      changeColor: _changeColor,
      changeFontSize: _changeFontSize,
    );
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (title.isEmpty && content.isEmpty) {
      return;
    }

    if (id == null) {
      if (title.isEmpty) {
        _state =
            state.copyWith(title: content.substring(0, content.length % 10));
      } else {
        _state = state.copyWith(title: title);
        _state = state.copyWith(content: content);
      }

      await useCases.addNoteUseCase(Note(
          title: _state.title!,
          content: _state.content!,
          color: _state.color,
          fontSize: _state.fontSize,
          addTime: DateTime.now().millisecondsSinceEpoch,
          editTime: DateTime.now().millisecondsSinceEpoch));
    } else {
      if (title.isEmpty) {
        _state =
            state.copyWith(title: content.substring(0, content.length % 10));
      } else {
        _state = state.copyWith(title: title);
        _state = state.copyWith(content: content);
      }

      await useCases.updateNoteUseCase(Note(
        id: id,
        title: _state.title!,
        content: _state.content!,
        color: _state.color,
        fontSize: _state.fontSize,
        editTime: DateTime.now().millisecondsSinceEpoch,
      ));
    }
  }

  Future<void> _changeColor(int color) async {
    _state = state.copyWith(color: color);
  }

  Future<void> _changeFontSize(int fontSize) async {
    _state = state.copyWith(fontSize: fontSize);
  }
}
