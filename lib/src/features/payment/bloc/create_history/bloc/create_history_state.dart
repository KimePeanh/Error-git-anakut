part of 'create_history_bloc.dart';

abstract class CreateHistoryState extends Equatable {
  const CreateHistoryState();

  @override
  List<Object> get props => [];
}

class CreateHistoryInitial extends CreateHistoryState {}

class CreatingHistory extends CreateHistoryState {}

class CreatedHistory extends CreateHistoryState {}

class ErrorCreateHistory extends CreateHistoryState {
  final String error;
  ErrorCreateHistory({required this.error});
}
