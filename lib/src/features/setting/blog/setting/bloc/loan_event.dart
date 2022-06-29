part of 'loan_bloc.dart';

abstract class LoanEvent extends Equatable {
  const LoanEvent();

  @override
  List<Object> get props => [];
}


class GetItemStarted extends LoanEvent{}

class Reload extends LoanEvent{}