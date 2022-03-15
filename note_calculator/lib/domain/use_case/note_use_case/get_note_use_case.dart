import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/domain/repo/note_repo_sqflite.dart';

class GetNoteUseCase {
  final NoteRepoSqflite noteRepoSqflite;

  GetNoteUseCase(this.noteRepoSqflite);

  Future<Note?> call(int id) async {
    return await noteRepoSqflite.getNoteById(id);
  }
}
