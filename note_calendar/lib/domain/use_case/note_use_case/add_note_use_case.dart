import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/domain/repo/note_repo_sqflite.dart';

class AddNoteUseCase {
  final NoteRepoSqflite noteRepoSqflite;

  AddNoteUseCase(this.noteRepoSqflite);

  Future<void> call(Note note) async {
    await noteRepoSqflite.insertNote(note);
  }
}
