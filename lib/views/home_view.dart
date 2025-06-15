import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_modalbottomsheet.dart';
import 'package:notes_app/widgets/note_widget.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = "Homeview";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) => ReadNoteCubit(),
        child: NotesViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return CustomModalbottomsheet();
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
