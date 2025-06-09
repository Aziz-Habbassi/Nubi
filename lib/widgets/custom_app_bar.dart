import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Notes",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: kprimaryColor,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade900,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 28, color: kprimaryColor),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
