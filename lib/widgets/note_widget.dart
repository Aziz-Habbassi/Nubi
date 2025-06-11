import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/views/edit_view.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditView.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: kforthColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "Flutter tips",
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
              subtitle: Text(
                "You can write your notes here with aziz",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "EduVICWANTHandPre",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, size: 32, color: Colors.black),
              ),
            ),
            Text("june 7 2025", style: TextStyle(color: Colors.black45)),
          ],
        ),
      ),
    );
  }
}
