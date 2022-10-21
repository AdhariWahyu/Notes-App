import 'package:belajar4/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const TABLE_NOTES = 'notes';
  static const TABLE_NOTES_ID = 'id';
  static const TABLE_NOTES_NOTE = 'note';
  static const TABLE_NOTES_TITLE = 'title';
  static const TABLE_NOTES_ISPINNED = 'isPinned';
  static const TABLE_NOTES_UPDATEDAT = 'updated_at';
  static const TABLE_NOTES_CREATEDAT = 'created_at';

  static Future<Database> init() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(join(dbPath, 'notes.db'), version: 1,
        onCreate: (newDb, version) {
      newDb.execute('''
        CREATE TABLE $TABLE_NOTES (
          $TABLE_NOTES_ID TEXT PRIMARY KEY,
          $TABLE_NOTES_TITLE TEXT,
          $TABLE_NOTES_NOTE TEXT,
          $TABLE_NOTES_ISPINNED INTEGER,
          $TABLE_NOTES_UPDATEDAT TEXT,
          $TABLE_NOTES_CREATEDAT TEXT
        )
        ''');
    });
  }

  Future<List<Note>> getAllNote() async {
    final db = await DatabaseHelper.init();
    final results = await db.query('notes');

    List<Note> listNote = [];
    results.forEach((data) {
      listNote.add(Note.fromDb(data));
    });

    return listNote;
  }

  Future<void> insertAllNote(List<Note> listNote) async {
    final db = await DatabaseHelper.init();
    Batch batch = db.batch();

    listNote.forEach((note) {
      batch.insert('notes', note.toDb());
    });

    await batch.commit();
  }
}
