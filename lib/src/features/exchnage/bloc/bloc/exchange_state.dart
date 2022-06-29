part of 'exchange_bloc.dart';

abstract class ExchangeState extends Equatable {
  const ExchangeState();

  @override
  List<Object> get props => [];
}

class FetchingExchnage extends ExchangeState {}

class FetchedExchange extends ExchangeState {}

class ErrorFetching extends ExchangeState {
  final String error;
  ErrorFetching({required this.error});
}
class End extends ExchangeState{}


