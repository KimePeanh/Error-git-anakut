part of 'exchange_bloc.dart';

abstract class ExchangeEvent extends Equatable {
  const ExchangeEvent();

  @override
  List<Object> get props => [];
}

class FetchExchangeStarted extends ExchangeEvent {}

class Refresh extends ExchangeState{}

