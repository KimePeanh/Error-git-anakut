part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class FetchingCounter extends CounterState {}

class FetchedCounter extends CounterState {}

class ErrorFetchingCounter extends CounterState {
  final String e;
  ErrorFetchingCounter({required this.e});
}
