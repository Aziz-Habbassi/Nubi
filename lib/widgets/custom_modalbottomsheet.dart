import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class CustomModalbottomsheet extends StatelessWidget {
  const CustomModalbottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNoteform();
  }
}

class AddNoteform extends StatefulWidget {
  const AddNoteform({super.key});

  @override
  State<AddNoteform> createState() => _AddNoteformState();
}

class _AddNoteformState extends State<AddNoteform> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
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
