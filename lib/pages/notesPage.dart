import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/components/drawer.dart';
import 'package:notes/components/notesTile.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/note_database.dart';
import 'package:provider/provider.dart';


class notesPage extends StatefulWidget {
  const notesPage({super.key});

  @override
  State<notesPage> createState() => _notesPageState();
}

class _notesPageState extends State<notesPage> {
  //text controller to access input
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    read();
  }
  //create note
  void createNote(){
    showDialog(context: context,
        builder: (context) => AlertDialog(

          content: TextField(
            controller: textController,
          ),
          actions: [
            //create
            MaterialButton(onPressed: (){
              //add to db
              context.read<noteDataBase>().addNote(textController.text);
              //clear controller
              textController.clear();
              //pop out dialog box
              Navigator.pop(context);
              },
              child: const Text('Create'),
            )
          ],
        ),
    );
  }

  //read note
  void read(){
    context.read<noteDataBase>().fetchNote();
  }

  //update note
  void update(Note note){
    //pre-filled
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Update Note'),
          content: TextField(controller: textController),
          actions: [
            //update buttton
            MaterialButton(onPressed: (){
              //update in db
              context.read<noteDataBase>().updateNote(note.id, textController.text);
              //clear controller
              textController.clear();
              //pop
              Navigator.pop(context);
              },
              child: Text('Update'),
            )
          ],
        ),
      );
  }
  //delete note
  void delete(int id){
    context.read<noteDataBase>().deleteNote(id);
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    //note db
    final NoteDataBase = context.watch<noteDataBase>();

    //current notes
    List<Note> currentNotes = NoteDataBase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:25),
            child: Text(
              "Notes",
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //list of notes
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context,index){
              final note = currentNotes[index];
            
              return notesTile(
                  text: note.text,
                  onEditPressed: () => update(note),
                  onDeletePressed: () =>delete(note.id),
              );

            },
            ),
          ),
        ],
      ),
    );
  }
}
