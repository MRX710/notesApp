import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/services/firestore.dart';
import '../textInputWidget.dart';
import '../entities/note/note.dart';
import '../entities/note/notesList.dart';


Note mockNote = Note(
    head: 'head',
    body: 'body',
    author: 'author'
);

class NotesPage extends StatefulWidget {

  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [];

  final FirestoreService firestoreService = FirestoreService();

  // void newNote(String text) {
  //   setState(() {
  //     notes.add(Note(head: text, body: text, author: text));
  //   });
  // }
  //
  // void editNote(String text) {
  //   setState(() {
  //     notes.add(Note(head: text, body: text, author: text));
  //   });
  // }

  // text controller
  final TextEditingController textController = TextEditingController();
  
  void openNotebox({String? docID}){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        // button to save
        ElevatedButton(
            onPressed: (){
              if (docID != null){
                firestoreService.updateNote(docID, textController.text);
              }
              else {
                firestoreService.addNote(textController.text);
              }
              textController.clear();
            },
            child: Text("Add")
        )
      ]
    ), );
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference notes = FirebaseFirestore.instance.colle

    return Scaffold(
        appBar: AppBar(title: const Text('Hello world!')),
        body:
        // Column(children: <Widget>[
          // Expanded(child: NoteList(notes)),
          // TextInputWidget(),
          StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getNotesStream(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              if (snapshot.hasData){
                List notesList = snapshot.data!.docs;
                // display as a list
                return ListView.builder(
                    itemCount: notesList.length,
                    itemBuilder: (context, index){
                      // get each doc
                      DocumentSnapshot document = notesList[index];
                      String docID = document.id;

                      // get note from each doc
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      String body = data['body'] as String;

                      // display
                      return ListTile(
                        title: Text(body),
                        trailing: IconButton(
                          onPressed: () => {openNotebox(docID: docID)},
                          icon: const Icon(Icons.settings),
                        ),
                      );
                  }
                );
              }
              
              return const Text('No notes...');
            },
          )
        // ])
        ,
        floatingActionButton: FloatingActionButton(
          onPressed: openNotebox,
          child: const Icon(Icons.add),
        ),
    );
  }
}
