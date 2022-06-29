part of 'delete_exchange_bloc.dart';

abstract class DeleteExchangeEvent extends Equatable {
  const DeleteExchangeEvent();

  @override
  List<Object> get props => [];
}

class DeletePress extends DeleteExchangeEvent {
  final int id;
  DeletePress({required this.id});
}
