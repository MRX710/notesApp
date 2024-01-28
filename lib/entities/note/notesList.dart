import 'package:flutter/material.dart';
import 'models/note.dart';

class NoteList extends StatefulWidget {
  final List<Note> listItems;

  const NoteList(this.listItems, {super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listItems.length,
        itemBuilder: (context, index) {
          var note = widget.listItems[index];
          return null;
          // return Note(note);
        });
  }
}
