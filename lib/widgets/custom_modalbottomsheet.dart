import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class CustomModalbottomsheet extends StatelessWidget {
  const CustomModalbottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
      children: const [
        CustomTextfield(title: "Title"),
        SizedBox(height: 20),
        CustomTextfield(title: "Content", maxlines: 7),
        SizedBox(height: 40),
        CustomButton(),
      ],
    );
  }
}
