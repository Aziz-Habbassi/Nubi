import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class EditView extends StatefulWidget {
  const EditView({super.key});
  static String id = "EditView";

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    NoteModel noteModel =
        ModalRoute.settingsOf(context)!.arguments as NoteModel;
    TextEditingController title = TextEditingController(text: noteModel.title);
    TextEditingController content = TextEditingController(
      text: noteModel.content,
    );
    return Form(
      key: key,
      autovalidateMode: autovalidateMode,
      child: Scaffold(
        appBar: CustomAppBar(
          icon: Icons.check,
          ontap: () {
            if (key.currentState!.validate()) {
              noteModel.title = title.text;
              noteModel.content = content.text;
              noteModel.save();
              BlocProvider.of<ReadNoteCubit>(context).fetchNotes();
              Navigator.pop(context);
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          children: [
            CustomTextfield(
              title: "title",
              oldtext: title.text,
              controller: title,
            ),
            const SizedBox(height: 35),
            CustomTextfield(
              title: "Content",
              minlines: 10,
              oldtext: content.text,
              controller: content,
            ),
          ],
        ),
      ),
    );
  }
}
