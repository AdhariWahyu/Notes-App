import 'package:belajar4/models/note.dart';
import 'package:belajar4/presentations/custom_icons_icons.dart';
import 'package:belajar4/screens/add_or_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belajar4/providers/notes.dart';

class NoteItem extends StatefulWidget {
  // const NoteItem({Key key}) : super(key: key);
  final String id;
  final BuildContext ctx;
  const NoteItem({
    @required this.id,
    @required this.ctx,
  });

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<Notes>(context, listen: false);
    Note note = notesProvider.getNote(widget.id);
    return Dismissible(
      key: Key(note.id),
      onDismissed: (direction) {
        notesProvider.deleteNote(note.id).catchError((onError) {
          ScaffoldMessenger.of(widget.ctx).clearSnackBars();
          ScaffoldMessenger.of(widget.ctx).showSnackBar(
            SnackBar(
              content: Text(onError.toString()),
            ),
          );
        });
      },
      child: GestureDetector(
        onTap: (() => Navigator.of(context)
            .pushNamed(AddOrDetailScreen.routeName, arguments: note.id)),
        child: GridTile(
          header: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                notesProvider.toggleIsPinned(note.id).catchError((onError) {
                  ScaffoldMessenger.of(widget.ctx).clearSnackBars();
                  ScaffoldMessenger.of(widget.ctx).showSnackBar(
                    SnackBar(
                      content: Text(onError.toString()),
                    ),
                  );
                });
              },
              icon: Icon(
                note.isPinned ? CustomIcons.pin : CustomIcons.pin_outline,
              ),
            ),
          ),
          footer: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            child: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(note.title),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[800],
                border: Border.all(),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(12),
            child: Text(note.note),
          ),
        ),
      ),
    );
  }
}
