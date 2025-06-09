import 'package:flutter/material.dart';
import 'package:notes_app/views/home_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {HomeView.id: (context) => HomeView()},
      initialRoute: HomeView.id,
    );
  }
}
