import 'package:flutter/material.dart';

import '../models/note.dart';


class OpenedNote extends StatefulWidget {
  const OpenedNote({super.key});

  @override
  State<OpenedNote> createState() => _OpenedNoteState();
}

class _OpenedNoteState<T extends OpenedNote> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class AddNotePage extends OpenedNote {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends _OpenedNoteState<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class EditNotePage extends OpenedNote {
  const EditNotePage({super.key});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends _OpenedNoteState<EditNotePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class OopenedNote extends StatefulWidget {

  Note? note;

  OopenedNote(this.note,  { super.key});

  void saveNote(){

  }


  @override
  State<OopenedNote> createState() => _OopenedNoteState();
}

class _OopenedNoteState extends State<OopenedNote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget?.note?.head ?? '')),
      body: Text(widget?.note?.body ?? ''),

      floatingActionButton: FloatingActionButton(
        onPressed: widget.saveNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
