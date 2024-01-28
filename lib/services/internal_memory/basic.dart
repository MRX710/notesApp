import 'dart:convert';
import 'dart:io';
import 'package:notes/entities/note/models/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';


class BaseDirectories{
  Directory temporaryDirectory;
  Directory appSupport;
  Directory appDocuments;

  BaseDirectories(this.temporaryDirectory, this.appSupport, this.appDocuments);
}

Future<BaseDirectories> getListOfCommonDirectories() async{
// Put cache files in this directory
  final Directory temporaryDirectory = await getTemporaryDirectory();
// For files that our app uses but are not exposed to the user
  final Directory appSupport = await getApplicationSupportDirectory();
// For user-generated files
  final Directory appDocuments = await getApplicationDocumentsDirectory();

  return BaseDirectories(
    temporaryDirectory,
    appSupport,
    appDocuments,
  );
}

Future<Directory> getNotesDirectory() async {
  final BaseDirectories directories = await getListOfCommonDirectories();
  final Directory appDocuments = directories.appDocuments;

  final Directory notesDirectory =
  Directory('${appDocuments.path}/notes');
  // Always check that the directory exists
  if (await notesDirectory.exists() == false) {
    await notesDirectory.create();
  }
  return notesDirectory;
}

Iterable<File> getNoteFiles(Directory notesDirectory){
  final List<FileSystemEntity> entities = notesDirectory.listSync();
  final Iterable<File> files = entities.whereType<File>();
  return files;
}

Future createNoteAsync(Note note) async {
  Directory notesDirectory = await getNotesDirectory();

  var uuid = const Uuid();
  String noteId = uuid.v1();
  note.id = noteId;

  final File file = File('${notesDirectory.path}/note$noteId.txt');

  await file.writeAsString(serializeNote(note));
}

Future delNoteAsync() async {
  Directory notesDirectory = await getNotesDirectory();

  final Iterable<File> files = getNoteFiles(notesDirectory);

  for (final File file in files) {
    await file.delete();
  }
}

Future<List<Map<String, dynamic>>> getNotesAsync() async {
  Directory notesDirectory = await getNotesDirectory();

  final Iterable<File> files = getNoteFiles(notesDirectory);

  List<Map<String, dynamic>> notes = [];

  for (final File file in files) {
    final String fileContent = await file.readAsString();
    // print(fileContent);
    notes.add(deserializeNote(fileContent));
  }

  return notes;
}

Map<String, dynamic> deserializeNote(String note){
  return json.decode(note);
}

String serializeNote(Note note){
  return json.encode(note);
}

Future init() async{
  // await createNote();
  // await delNoteAsync();

  await getNotesAsync();
  // await delNote();
}