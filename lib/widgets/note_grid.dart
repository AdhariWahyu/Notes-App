import 'package:belajar4/models/note.dart';
import 'package:belajar4/providers/notes.dart';
import 'package:belajar4/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesGrid extends StatefulWidget {
  // const NotesGrid({Key key}) : super(key: key);

  @override
  State<NotesGrid> createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<Notes>(context);
    List<Note> listNote = notesProvider.notes;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: listNote.length,
        itemBuilder: (context, index) => NoteItem(
          id: listNote[index].id,
          ctx: context,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
      ),
    );
  }
}
