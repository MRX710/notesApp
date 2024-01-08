import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/note/models/note.dart';

class FirestoreService {
  // get collections  of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  // create
  Future<void> addNote(String note){
    return notes.add({
      // 'id': note?.id,
      // 'head': note.head,
      'body': note,
      'timestamp': Timestamp.now()
      // 'author': note.author
    });
  }

  Future<void> updateNote(String docID, String note){
    return notes.doc(docID).update({
      // 'id': note?.id,
      // 'head': note.head,
      'body': note,
      'timestamp': Timestamp.now()
      // 'author': note.author
    });
  }



  // read
  Stream<QuerySnapshot> getNotesStream(){
    final notesStream = notes.orderBy('timestamp', descending: false).snapshots();
    return notesStream;
  }



}