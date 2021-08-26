import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/db/notes.dart';
import 'package:untitled/model/note.dart';

import 'edit_note_page.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({Key? key, required this.noteId}) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Center(
              child: Container(
                  alignment: Alignment.center,
                  height: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 3),
                  width: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 5),
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.shade400,
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          Border.all(color: Colors.lightBlueAccent.shade700, width: 1.5)),
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(
                          child: ListView(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            children: [
                              Text(
                                note.title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                DateFormat.yMMMd().format(note.createdTime),
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                note.description,
                                style:
                                    TextStyle(color: Colors.black, fontSize: 18),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
            ),
      );

  Widget editButton() => IconButton(
      onPressed: () async {
        if (isLoading) return;
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddEditNotePage(note: note)));
        refreshNote();
      },
      icon: Icon(Icons.edit_outlined));

  Widget deleteButton() => IconButton(
      onPressed: () async {
        await NotesDatabase.instance.delete(widget.noteId);
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.delete));
}
