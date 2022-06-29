part of 'reciept_bloc.dart';

abstract class RecieptState extends Equatable {
  const RecieptState();

  @override
  List<Object> get props => [];
}

class RecieptInitial extends RecieptState {}

class FetchingReciept extends RecieptState {}

class FetchedREciept extends RecieptState {}

class ErrorFetchReceipt extends RecieptState {
  final String e;
  ErrorFetchReceipt({required this.e});
}
