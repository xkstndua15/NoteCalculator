import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/domain/repo/note_repo_sqflite.dart';

class GetNotesUseCase {
  final NoteRepoSqflite noteRepoSqflite;

  GetNotesUseCase(this.noteRepoSqflite);

  Future<List<Note>> call() async {
    return await noteRepoSqflite.getNotes();
  }
}
