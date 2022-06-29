import 'package:anakut_bank/src/features/pin/repository/set_pin_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'setpin_event.dart';
part 'setpin_state.dart';

class SetpinBloc extends Bloc<SetpinEvent, SetpinState> {
  SetPinRepository setPinRepository = SetPinRepository();

  @override
  SetpinBloc() : super(SetpinInitial());

  @override
  Stream<SetpinState> mapEventToState(SetpinEvent event) async* {
    if (event is SetPinPress) {
      yield SettingPin();
      try {
        Future.delayed(Duration(microseconds: 200));
        final String mes =
            await setPinRepository.setPin(pin: event.pin, otp: event.otp);
        yield SettedPin();
      } catch (e) {
        print(e.toString());
        yield ErrorSet(error: e.toString());
      }
    }
  }
}
