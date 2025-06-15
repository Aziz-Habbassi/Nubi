import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app/cubits/read_note_cubit/read_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class CustomModalbottomsheet extends StatelessWidget {
  const CustomModalbottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubitCubit(),
      child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitSuccess) {
            BlocProvider.of<ReadNoteCubit>(context).fetchNotes();
            Navigator.pop(context);
          }
          if (state is AddNoteCubitFailure) {
            debugPrint(state.errmessage);
          }
        },
        builder: (context, state) {
          return state is AddNoteCubitLoading
              ? SpinKitSpinningLines(color: kprimaryColor, size: 150)
              : AddNoteForm();
        },
      ),
    );
  }
}
