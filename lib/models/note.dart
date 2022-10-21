import 'package:belajar4/database/database_helper.dart';
import 'package:flutter/cupertino.dart';

class Note {
  final String id;
  final String title;
  final String note;
  final DateTime updatedAt;
  final DateTime createdAt;
  bool isPinned;

  Note(
      {@required this.id,
      @required this.title,
      @required this.note,
      @required this.updatedAt,
      @required this.createdAt,
      this.isPinned = false});

  Note.fromDb(Map<String, dynamic> data)
      : id = data[DatabaseHelper.TABLE_NOTES_ID],
        title = data[DatabaseHelper.TABLE_NOTES_TITLE],
        note = data[DatabaseHelper.TABLE_NOTES_NOTE],
        isPinned = data[DatabaseHelper.TABLE_NOTES_ISPINNED] == 1,
        updatedAt = DateTime.parse(data[DatabaseHelper.TABLE_NOTES_UPDATEDAT]),
        createdAt = DateTime.parse(data[DatabaseHelper.TABLE_NOTES_CREATEDAT]);

  Map<String, dynamic> toDb() {
    return {
      DatabaseHelper.TABLE_NOTES_ID: id,
      DatabaseHelper.TABLE_NOTES_TITLE: title,
      DatabaseHelper.TABLE_NOTES_NOTE: note,
      DatabaseHelper.TABLE_NOTES_ISPINNED: isPinned,
      DatabaseHelper.TABLE_NOTES_UPDATEDAT: updatedAt,
      DatabaseHelper.TABLE_NOTES_CREATEDAT: createdAt,
    };
  }

  Note copyWith({
    String id,
    String title,
    String note,
    DateTime updatedAt,
    DateTime createdAt,
    bool isPinned,
  }) {
    return Note(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        isPinned: isPinned ?? this.isPinned);
  }
}
