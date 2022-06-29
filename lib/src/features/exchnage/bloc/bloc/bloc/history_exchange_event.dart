part of 'history_exchange_bloc.dart';

abstract class HistoryExchangeEvent extends Equatable {
  const HistoryExchangeEvent();

  @override
  List<Object> get props => [];
}

class InitializeExpenseList extends HistoryExchangeEvent {
  final String? dateRange;
  InitializeExpenseList({required this.dateRange});
}

class FetchExpenseList extends HistoryExchangeEvent {
  final arg;
  FetchExpenseList({required this.arg});
}

class TriggerList extends HistoryExchangeEvent {}
