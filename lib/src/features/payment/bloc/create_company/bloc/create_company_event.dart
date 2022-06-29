part of 'create_company_bloc.dart';

abstract class CreateCompanyEvent extends Equatable {
  const CreateCompanyEvent();

  @override
  List<Object> get props => [];
}


class CreatePress extends CreateCompanyEvent{
  final String name;
  final String logo;
  final int id;
  final String code;

  CreatePress({required this.name, required this.logo, required this.id, required this.code});
}