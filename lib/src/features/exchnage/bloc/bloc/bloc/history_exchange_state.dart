part of 'history_exchange_bloc.dart';

abstract class HistoryExchangeState extends Equatable {
  const HistoryExchangeState();
  
  @override
  List<Object> get props => [];
}


class InitializingExpenseList extends HistoryExchangeState {}

class InitializedExpenseList extends HistoryExchangeState {}

class FetchingExpenseList extends HistoryExchangeState {}

class FetchedExpenseList extends HistoryExchangeState {}

class EndOfExpenseList extends HistoryExchangeState {}

class ErrorFetchingExpenseList extends HistoryExchangeState {
  final String error;
  ErrorFetchingExpenseList({required this.error});

}

class ErrorInitializingExpenseList extends HistoryExchangeState {
  final String error;
  ErrorInitializingExpenseList({required this.error});

}
