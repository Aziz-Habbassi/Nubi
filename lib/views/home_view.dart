import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "Homeview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(children: [
          
        ],
      ),
    );
  }
}
