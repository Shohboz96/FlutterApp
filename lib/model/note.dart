
final String tableNotes = 'notes';

class NoteFields{

  static final List<String> values = [
    id, isImportant, number, title, description, title
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title= 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Note{
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime
  });

  Note copy({
  int? id,
  bool? isImportant,
  int? number,
  String? title,
  String? description,
    DateTime? createdTime,
}) => Note(
    id: id ?? this.id,
    isImportant: isImportant ?? this.isImportant,
    number: number ?? this.number,
    title: title ?? this.title,
    description: description ?? this.description,
    createdTime: createdTime ?? this.createdTime,
  );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,

  );


  Map<String,Object?> toJson() =>{
    NoteFields.id:id,
    NoteFields.title:title,
    NoteFields.isImportant:isImportant ? 1: 0,
    NoteFields.number:number,
    NoteFields.description:description,
    NoteFields.title:createdTime.toIso8601String(),
  };
}