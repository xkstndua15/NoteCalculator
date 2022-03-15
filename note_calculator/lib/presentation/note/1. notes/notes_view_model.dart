import 'package:flutter/material.dart';
import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/domain/use_case/note_use_case/note_use_cases.dart';
import 'package:note_calendar/presentation/note/1.%20notes/event/notes_event.dart';
import 'package:note_calendar/presentation/note/1.%20notes/state/notes_state.dart';

class NoteViewModel with ChangeNotifier {
  final NoteUseCases useCases;
  Note? _recentDeleteNote;

  NoteViewModel(this.useCases) {
    _loadNotes();
  }

  NotesState _state = NotesState(
    notes: [],
  );

  NotesState get state => _state;

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotesUseCase();
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    _recentDeleteNote = note;

    await useCases.deleteNoteUseCase(note);

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentDeleteNote != null) {
      await useCases.addNoteUseCase(_recentDeleteNote!);
      _recentDeleteNote = null;
    }

    await _loadNotes();
  }
}
