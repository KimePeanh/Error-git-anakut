part of 'create_cashout_bloc.dart';

abstract class CreateCashoutState extends Equatable {
  const CreateCashoutState();
  
  @override
  List<Object> get props => [];
}

class CreateCashoutInitial extends CreateCashoutState {}


class CreatingCashout extends CreateCashoutState {}

class CreatedCashout extends CreateCashoutState {}

class ErrorCreateCashout extends CreateCashoutState {
  final String e;
  ErrorCreateCashout({required this.e});
}