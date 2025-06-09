import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.title, this.maxlines = 1});
  final String title;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
