part of 'edit_bloc.dart';

abstract class EditState extends Equatable {
  const EditState();

  @override
  List<Object> get props => [];
}

class EditInitial extends EditState {}

class Editing extends EditState {}

class Edited extends EditState {}

class ErrorEdit extends EditState {
  final String e;
  ErrorEdit({required this.e});
}
