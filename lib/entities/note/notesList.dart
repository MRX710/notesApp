import 'package:flutter/material.dart';
import './note.dart';

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
          return Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ListTile(
                        title: Text(note.head),
                        subtitle: Text(note.body),
                      )),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        // style: TextStyle(fontSize: 20),
                        child: Text(
                          note.author.toString(),
                        ),
                      ),
                      IconButton(
                          icon: const Icon(Icons.thumb_up),
                          onPressed: () => {}, // edit,
                          color: Theme.of(context).primaryColor
                        // color: note.userLiked ? Colors.green : Colors.black
                      )
                    ],
                  )
                ],
              ));
        });
  }
}
