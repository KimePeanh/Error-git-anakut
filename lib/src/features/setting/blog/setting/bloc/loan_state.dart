part of 'loan_bloc.dart';

abstract class LoanState extends Equatable {
  const LoanState();
  
  @override
  List<Object> get props => [];
}

class LoanInitial extends LoanState {}

class Gettingitem extends LoanState{}

class Getteditem extends LoanState{}

class ErrorGet extends LoanState{}

class End extends LoanState{}

class Reloading extends LoanState{}