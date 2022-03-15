import 'package:note_calendar/domain/use_case/note_use_case/add_note_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/delete_note_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/get_note_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/get_notes_use_case.dart';
import 'package:note_calendar/domain/use_case/note_use_case/update_note_use_case.dart';

class NoteUseCases {
  AddNoteUseCase addNoteUseCase;
  DeleteNoteUseCase deleteNoteUseCase;
  GetNoteUseCase getNoteUseCase;
  GetNotesUseCase getNotesUseCase;
  UpdateNoteUseCase updateNoteUseCase;

  NoteUseCases({
    required this.addNoteUseCase,
    required this.deleteNoteUseCase,
    required this.getNoteUseCase,
    required this.getNotesUseCase,
    required this.updateNoteUseCase,
  });
}
