import 'package:anakut_bank/src/features/exchnage/repository/create_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  @override
  CreateBloc() : super(CreateInitial());

  CreateRepository _createRepository = CreateRepository();
  late int id;
  @override
  Stream<CreateState> mapEventToState(CreateEvent event) async* {
    if (event is SubmitPress) {
      yield Creating();
      try {
        Future.delayed(Duration(microseconds: 200));
        id = await _createRepository.CreateExchange(
            rate_type: "rate_in",
            counter_id: event.counter_id,
            currency_in: event.currency_in,
            currency_out: event.currency_out,
            rate: event.rate,
            amount_in: event.amount_in,
            amount_out: event.amount_out);
        yield Created();
      } catch (e) {
        print(e.toString());
        yield ErrorCreating(e: e.toString());
      }
    }
  }
}
