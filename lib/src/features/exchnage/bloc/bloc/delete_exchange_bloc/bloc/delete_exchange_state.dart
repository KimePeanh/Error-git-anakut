part of 'delete_exchange_bloc.dart';

abstract class DeleteExchangeState extends Equatable {
  const DeleteExchangeState();

  @override
  List<Object> get props => [];
}

class DeleteExchangeInitial extends DeleteExchangeState {}

class Deleting extends DeleteExchangeState {}

class Deleted extends DeleteExchangeState {}

class ErrorDelete extends DeleteExchangeState {
  final String e;
  ErrorDelete(this.e);
}
