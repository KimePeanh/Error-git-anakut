part of 'company_cate_bloc.dart';

abstract class CompanyCateState extends Equatable {
  const CompanyCateState();
  
  @override
  List<Object> get props => [];
}

class CompanyCateInitial extends CompanyCateState {}

class FetchingCate extends CompanyCateState{}

class FetchedCate extends CompanyCateState{}

class ErrorFetchCate extends CompanyCateState{
  final String e;
  ErrorFetchCate({required this.e});
}

class Refreshing extends CompanyCateState{}

class EndCate extends CompanyCateState{}

class loading extends CompanyCateState{}

