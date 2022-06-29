part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
  
  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}


class GettingHistory extends HistoryState {}

class GettedHistory extends HistoryState {}

class ErrorGettingHistory extends HistoryState {
  final String e;
  ErrorGettingHistory({required this.e});
}

class loading extends HistoryState {}

class End extends HistoryState {}