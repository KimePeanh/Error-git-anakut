import 'package:anakut_bank/src/features/payment/repository/create_company_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_company_event.dart';
part 'create_company_state.dart';

class CreateCompanyBloc extends Bloc<CreateCompanyEvent, CreateCompanyState> {
  CreateCompanyBloc() : super(CreateCompanyInitial());

  CreateCompanyRepository companyRepository = CreateCompanyRepository();

  @override
  Stream<CreateCompanyState> mapEventToState(CreateCompanyEvent event) async* {
    if (event is CreatePress) {
      yield CreatingCompany();
      try {
        await companyRepository.createcompany(
            logo: event.logo,
            company_name: event.name,
            company_code: event.code,
            id: event.id);
        yield CreatedCompany();
      } catch (e) {
        print(e.toString());
        yield ErrorCreate(e: e.toString());
      }
    }
  }
}
