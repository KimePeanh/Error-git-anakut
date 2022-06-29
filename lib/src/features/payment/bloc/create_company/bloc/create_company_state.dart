part of 'create_company_bloc.dart';

abstract class CreateCompanyState extends Equatable {
  const CreateCompanyState();
  
  @override
  List<Object> get props => [];
}

class CreateCompanyInitial extends CreateCompanyState {}


class CreatingCompany extends CreateCompanyState {}

class CreatedCompany extends CreateCompanyState {}

class ErrorCreate extends CreateCompanyState {
  final String e;
  ErrorCreate ({required this.e});
}