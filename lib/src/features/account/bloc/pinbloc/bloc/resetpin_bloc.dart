import 'package:anakut_bank/src/features/account/repository/reset_pin_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resetpin_event.dart';
part 'resetpin_state.dart';

class ResetpinBloc extends Bloc<ResetpinEvent, ResetpinState> {
  ResetPinRepo resetPinRepo = ResetPinRepo();

  @override
  ResetpinBloc() : super(ResetpinInitial());

  @override
  Stream<ResetpinState> mapEventToState(ResetpinEvent event) async* {
    if (event is ResetPressed) {
      yield Resetting();
      try {
        Future.delayed(Duration(microseconds: 200));
        final String mes = await resetPinRepo.Resetpin(
            old_pin: event.old_pin, new_pin: event.new_pin);
        yield Resetted();
      } catch (e) {}
    }
  }
}
