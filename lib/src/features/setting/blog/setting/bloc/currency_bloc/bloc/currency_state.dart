part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}


class FetchingCurrency extends CurrencyState {}

class FetchedCurrency extends CurrencyState {}

class ErrorFetchingCurrency extends CurrencyState {
  final String e;
  ErrorFetchingCurrency({required this.e});
}
