import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());
  bool isLoading = false;
  Future<void> addNote(NoteModel note) async {
    isLoading = true;
    emit(AddNoteCubitLoading());
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      isLoading = false;
      emit(AddNoteCubitSuccess());
    } catch (e) {
      isLoading = false;
      emit(AddNoteCubitFailure(errmessage: e.toString()));
    }
  }
}
