import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_modalbottomsheet.dart';
import 'package:notes_app/widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "Homeview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return NoteWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return CustomModalbottomsheet();
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
