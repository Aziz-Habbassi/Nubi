part of 'add_note_cubit_cubit.dart';

@immutable
sealed class AddNoteCubitState {}

final class AddNoteCubitInitial extends AddNoteCubitState {}

final class AddNoteCubitSuccess extends AddNoteCubitState {}

final class AddNoteCubitLoading extends AddNoteCubitState {}

final class AddNoteCubitFailure extends AddNoteCubitState {
  final String message;

  AddNoteCubitFailure({required this.message});
}
