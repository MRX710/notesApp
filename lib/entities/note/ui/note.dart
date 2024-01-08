import 'package:flutter/material.dart';
import '../models/note.dart';



class NoteWidget extends StatefulWidget{
  Note note;


  // Note({
  //   super.key,
  //   this.id,
  //   required this.head,
  //   required this.body,
  //   this.fav = false,
  //   this.lastUpdate
  //   // required this.lastUpdate
  // });
  NoteWidget(this.note,  { super.key});


  // Note.fromJson(Map<String, dynamic> json, {super.key}) :
  //       id = json['id'],
  //       head = json['head'],
  //       body = json['body'],
  //       lastUpdate = null,
  //       // lastUpdate = DateTime.parse(json['lastUpdate']),
  //       fav = json['fav'];

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}


class _NoteWidgetState extends State<NoteWidget> {

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(widget.note.body),
      trailing: IconButton(
        onPressed: () => {
          // openNotebox(docID: docID)
        },
        icon: const Icon(Icons.edit),
      ),
    );

  }
}
