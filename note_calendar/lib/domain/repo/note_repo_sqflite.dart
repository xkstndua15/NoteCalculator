import 'package:note_calendar/domain/model/note/note.dart';

abstract class NoteRepoSqflite {
  Future<List<Note>> getNotes();

  Future<Note?> getNoteById(int id);

  Future<void> insertNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deleteNote(Note note);
}
