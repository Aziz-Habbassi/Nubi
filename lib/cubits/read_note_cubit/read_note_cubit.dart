import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  ReadNoteCubit() : super(ReadNoteInitial());
  List<NoteModel>? list;
  void fetchNotes() {
    Box<NoteModel> box = Hive.box<NoteModel>(kNotesBox);
    list = box.values.toList();

    list = list!.reversed.toList();
    emit(ReadNoteSuccess());
  }
}
