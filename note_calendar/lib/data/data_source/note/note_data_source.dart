import 'package:note_calendar/domain/model/note/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDataSource {
  Database db;

  NoteDataSource(this.db);

  Future<List<Note>> getNotes() async {
    final maps = await db.query('note');

    return maps.map((e) => Note.fromJson(e)).toList();
  }

  Future<Note?> getNoteById(int id) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> insertNote(Note note) async {
    await db.insert('note', note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await db
        .update('note', note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> deleteNote(Note note) async {
    await db.delete('note', where: 'id = ?', whereArgs: [note.id]);
  }
}
