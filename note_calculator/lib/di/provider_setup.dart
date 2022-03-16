import 'package:note_calendar/data/data_source/note/note_data_source.dart';
import 'package:note_calendar/data/repo/note_repo_sqflite_impl.dart';
import 'package:note_calendar/domain/repo/note_repo_sqflite.dart';
import 'package:note_calendar/domain/use_case/note_use_case/add_note_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/delete_note_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/get_note_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/get_notes_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/note_use_cases.dart';
import 'package:note_calendar/domain/use_case/note_use_case/update_note_use_case.dart';
import 'package:note_calendar/presentation/1.%20main/main_view_model.dart';
import 'package:note_calendar/presentation/2.%20note/1.%20notes/notes_view_model.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/add_edit_note_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database db =
      await openDatabase('notes_db', version: 1, onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, fontSize INTEGER, addTime INTEGER,editTime INTEGER)');
  });

  NoteDataSource noteDataSource = NoteDataSource(db);
  NoteRepoSqflite noteRepoSqflite = NoteRepoSqfliteImpl(noteDataSource);
  NoteUseCases useCases = NoteUseCases(
    addNoteUseCase: AddNoteUseCase(noteRepoSqflite),
    deleteNoteUseCase: DeleteNoteUseCase(noteRepoSqflite),
    getNotesUseCase: GetNotesUseCase(noteRepoSqflite),
    getNoteUseCase: GetNoteUseCase(noteRepoSqflite),
    updateNoteUseCase: UpdateNoteUseCase(noteRepoSqflite),
  );
  NotesViewModel notesViewModel = NotesViewModel(useCases);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(useCases);
  MainViewModel mainViewModel = MainViewModel();

  return [
    ChangeNotifierProvider(create: (_) => mainViewModel),
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}
