import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:untitled/model/note.dart';

class NotesDatabase{
  NotesDatabase._init();
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;

  Future<Database> get database async{
    if(_database != null) {
      return _database!;
    }
    else{
      _database = await _initDb('notes.db');
      return _database!;
    }
  }
  Future<Database> _initDb(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path,version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

      await db.execute('''
      CREATE TABLE $tableNotes(
      ${NoteFields.id} $idType,
      ${NoteFields.isImportant} $boolType,
      ${NoteFields.number} $integerType,
      ${NoteFields.title} $textType,
      ${NoteFields.description} $textType,
      ${NoteFields.time} $textType,
      )
      ''');

  }

  Future<Note> create(Note note) async{
    final db = await instance.database;
    // final json = note.toJson();
    // final columns = '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values = '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);

  }

  Future<Note> readNote(int id) async{
    final db = await instance.database;
    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ? ',
      whereArgs: [id],
    );
    if(maps.isNotEmpty){
      return Note.fromJson(maps.first);
    }
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }

}