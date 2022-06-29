import 'package:anakut_bank/src/features/exchnage/repository/edit_exchange_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditInitial());

  EditExchangeRepository editExchangeRepository = EditExchangeRepository();

  @override
  Stream<EditState> mapEventToState(EditEvent event) async* {
    if (event is EditPress) {
      yield Editing();
      try {
        await editExchangeRepository.EditExchange(
            currency_in: event.currency_in,
            currency_out: event.currency_out,
            rate: event.rate,
            amount_in: event.amount_in,
            amount_out: event.amount_out,
            id: event.id);
        yield Edited();
      } catch (e) {
        print(e.toString());
        yield ErrorEdit(e: e.toString());
      }
    }
  }
}
