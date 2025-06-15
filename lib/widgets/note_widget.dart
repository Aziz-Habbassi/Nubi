import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditView.id, arguments: noteModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                noteModel.title,
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
              subtitle: Text(
                overflow: TextOverflow.fade,
                maxLines: 2,
                noteModel.content,
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "EduVICWANTHandPre",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<ReadNoteCubit>(context).fetchNotes();
                },
                icon: Icon(Icons.delete, size: 32, color: Colors.black),
              ),
            ),
            Text(noteModel.date, style: TextStyle(color: Colors.black45)),
          ],
        ),
      ),
    );
  }
}
