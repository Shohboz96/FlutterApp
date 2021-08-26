import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Switch(
                    value: isImportant ?? false,
                    onChanged: onChangedImportant,
                  ),
                  Expanded(
                    child: Slider(
                      value: (number ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (number) => onChangedNumber(number.toInt()),
                    ),
                  )
                ],
              ),
              buildTitle(),
              SizedBox(height: 8),
              buildDescription(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle() =>
      Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.shade400,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.lightBlueAccent.shade700,width: 1.5)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
          child: TextFormField(
    cursorColor: Colors.redAccent,
            maxLines: 1,
            initialValue: title,
            style: TextStyle(
              color: Colors.green.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Title',
              hintStyle: TextStyle(color: Colors.white70),
            ),
            validator: (title) =>
                title != null && title.isEmpty ? 'The title cannot be empty' : null,
            onChanged: onChangedTitle,
          ),
        ),
      );

  Widget buildDescription() => Container(
    decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade400,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.lightBlueAccent.shade700,width: 1.5)
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16.0),
      child: TextFormField(
        cursorColor: Colors.redAccent,
            maxLines: 5,
            initialValue: description,
            style: TextStyle( color: Colors.green.shade700, fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Type something...',
              hintStyle: TextStyle(color: Colors.white60),
            ),
            validator: (title) => title != null && title.isEmpty
                ? 'The description cannot be empty'
                : null,
            onChanged: onChangedDescription,
          ),
    ),
  );
}
