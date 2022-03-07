import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/domain/repo/note_repo_sqflite.dart';

class GetNoteUseCase {
  final NoteRepoSqflite noteRepoSqflite;

  GetNoteUseCase(this.noteRepoSqflite);

  Future<List<Note>> call() async {
    return await noteRepoSqflite.getNotes();
  }
}
