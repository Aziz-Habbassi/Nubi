import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});
  static String id = "EditView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        children: [
          CustomTextfield(title: "title"),
          SizedBox(height: 35),
          CustomTextfield(title: "Content", maxlines: 5),
          SizedBox(height: 50),
          CustomButton(),
        ],
      ),
    );
  }
}
