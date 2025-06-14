import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          top: 35,
          right: 25,
          left: 25,
          bottom: MediaQuery.of(context).viewInsets.bottom + 35,
        ),
        children: [
          CustomTextfield(
            title: "Title",
            onsaved: (data) {
              title = data;
            },
          ),
          const SizedBox(height: 20),
          CustomTextfield(
            title: "Content",
            maxlines: 7,
            onsaved: (data) {
              content = data;
            },
          ),
          const SizedBox(height: 40),
          CustomButton(
            ontap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                NoteModel note = NoteModel(
                  title: title!,
                  content: content!,
                  date: DateFormat.yMEd().format(DateTime.now()),
                  color: ksecondaryColor.toARGB32(),
                );
                BlocProvider.of<AddNoteCubitCubit>(context).addNote(note);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
