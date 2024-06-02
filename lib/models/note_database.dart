import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:notes/models/note.dart';
import 'package:path_provider/path_provider.dart';

class noteDataBase extends ChangeNotifier{
  static late Isar isar;

  //initialize data base
  static Future<void> initialize() async{
    // we get path directory
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }
  //list of notes
  final List<Note> currentNotes = [];

  //create new notes in database
  Future<void> addNote(String textFromUser) async{
    //create object of notes
    final newNote = Note()..text = textFromUser; // textFromUser

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    //re-read form db
    fetchNote();
  }

  //read note from database]
  Future<void> fetchNote() async{
    List<Note> fetchNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
    notifyListeners();
  }

  //update note from database
  Future<void> updateNote(int id,String newText) async{
    final existingNote = await isar.notes.get(id);
    if(existingNote != null){
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNote();
    }
  }

  //delete note from database
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
  }

}