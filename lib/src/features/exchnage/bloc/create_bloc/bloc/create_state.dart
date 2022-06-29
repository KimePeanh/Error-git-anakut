part of 'create_bloc.dart';

abstract class CreateState extends Equatable {
  const CreateState();

  @override
  List<Object> get props => [];
}

class CreateInitial extends CreateState {}

class Creating extends CreateState {}

class Created extends CreateState {}

class ErrorCreating extends CreateState {
  final String e;
  ErrorCreating({required this.e});
}
