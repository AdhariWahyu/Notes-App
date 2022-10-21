import 'package:belajar4/providers/notes.dart';
import 'package:belajar4/screens/add_or_detail_screen.dart';
import 'package:belajar4/widgets/note_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: FutureBuilder(
        future: Provider.of<Notes>(context, listen: false).getAndSetNotes(),
        builder: (context, notesSnapshot) {
          if (notesSnapshot.connectionState == ConnectionState.waiting)
            return const Center(
              child: CircularProgressIndicator(),
            );
          if (notesSnapshot.hasError) {
            return Center(
              child: Text(notesSnapshot.error.toString()),
            );
          }
          return NotesGrid();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddOrDetailScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
