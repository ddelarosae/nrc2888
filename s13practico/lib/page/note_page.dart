import 'package:flutter/material.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import '../page/edit_note_page.dart';
import '../page/note_detail_page.dart';
import '../widget/note_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotePage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotePage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NoteDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    this.notes = await NoteDatabase.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notas',
            style: TextStyle(fontSize: 24),
          ),
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 12,
            )
          ],
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : notes.isEmpty
                  ? const Text(
                      'No hay notas',
                      style: TextStyle(color: Colors.red, fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditNotePage()),
            );
            refreshNotes();
          },
        ),
      );
  Widget buildNotes() => StaggeredGridView.countBuilder(
        //revisar libreria
        padding: const EdgeInsets.all(8),
        itemCount: notes.length,
        StaggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteID: note.id!),
              ));
              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}