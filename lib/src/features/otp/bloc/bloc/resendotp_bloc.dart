import 'package:anakut_bank/src/features/otp/repository/otp_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resendotp_event.dart';
part 'resendotp_state.dart';

class ResendotpBloc extends Bloc<ResendotpEvent, ResendotpState> {
  otpRepository otp = otpRepository();

  @override
  ResendotpBloc() : super(ResendotpInitial());

  @override
  Stream<ResendotpState> mapEventToState(ResendotpEvent event) async* {
    if (event is ResendPress) {
      yield Resending();
      try {
        Future.delayed(Duration(microseconds: 200));
        await otp.ConfirmOTP();
        yield Resentt();
      } catch (e) {
        print(e);
        yield ErrorResend(e: e.toString());
      }
    }
  }
}
