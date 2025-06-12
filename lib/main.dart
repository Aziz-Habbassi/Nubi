import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/views/edit_view.dart';
import 'package:notes_app/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        HomeView.id: (context) => HomeView(),
        EditView.id: (context) => EditView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
