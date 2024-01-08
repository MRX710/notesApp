import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/firestore.dart';
import '../entities/note/models/note.dart';
import '../services/internal_memory/basic.dart';
import '../textInputWidget.dart';
import '../entities/note/ui/note.dart';



class NotesPage extends StatefulWidget {

  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [];
  bool dataIsLoaded = false;

  @override
  void initState() {
    super.initState();
    getNotes();
    setState(() => dataIsLoaded = !dataIsLoaded);
  }

  Future<void> getNotes()async{
    List<Map<String, dynamic>> noteList = await getNotesAsync();
    setNotes(noteList);
  }

  setNotes(List<Map<String, dynamic>>? notesList){

    List<Note> notesTemp = [];
    for (var index = 0; index < notesList!.length; index++){
      Map<String, dynamic> noteMap = notesList[index];
      var note = Note.fromJson(noteMap);
      notesTemp.add(
          note
      );
    }
    setState(() {
      notes = notesTemp;
    });
  }

  addNote(BuildContext context){
    createNoteAsync(Note(
      head: 'Head 1',
      body: textController.text,
      // lastUpdate: DateTime.now()
    ));

    getNotes();
    textController.clear();
    Navigator.pop(context);

    // setState(() {
    //   // notes.add(noteWidget);
    //   notes = [...notes, noteWidget];
    // });
  }

  final TextEditingController textController = TextEditingController();
  
  void openNote({String? docID}){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        // button to save
        ElevatedButton(
            onPressed: () => addNote(context),
            child: Text("Add")
        )
      ]
    ), );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text('Hello world!')),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            ...notes.map((note) => NoteWidget(note)),
            if (dataIsLoaded && notes?.length == 0) const Text('No notes...')
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: openNote,
          child: const Icon(Icons.add),
        ),
    );
  }
}
