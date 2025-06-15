part of 'read_note_cubit.dart';

@immutable
sealed class ReadNoteState {}

final class ReadNoteInitial extends ReadNoteState {}

final class ReadNoteSuccess extends ReadNoteState {}
