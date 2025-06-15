import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.onsaved,
    this.oldtext,
    this.controller,
  });
  final String title;
  final int maxlines;
  final void Function(String?)? onsaved;
  final String? oldtext;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onsaved,
      validator: (value) {
        if (value!.isEmpty) {
          return "Fill the field";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kprimaryColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kprimaryColor, width: 1.5),
        ),
        hintText: title,
      ),
      maxLines: maxlines,
    );
  }
}
