import 'package:anakut_bank/src/features/Auth/bloc/bloc/auth_bloc.dart';
import 'package:anakut_bank/src/features/account/bloc/bloc/account_bloc.dart';
import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/login/screen/new_login.dart';
import 'package:anakut_bank/src/features/otp/screen/otp.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String ver = "";

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        return BlocBuilder<AccountBloc, AccountState>(
            builder: (context, statee) {
          if (statee is FetchingAccount) {
            return Container(
              color: white,
              child: Center(
                child: Image(
                  width: 150,
                  height: 150,
                  image: AssetImage('assets/images/logobank.png'),
                ),
              ),
            );
          } else if (statee is FetchedAccount) {
            if (BlocProvider.of<AccountBloc>(context)
                    .accountModel!
                    .verified_status ==
                "completed") {
              return HomeScreen("");
            } else {
              return OTP(
                  BlocProvider.of<AccountBloc>(context).accountModel!.email!);
            }
          }
           return NewLogin();
        });
      }
      if (state is NotAuthenticated) {
        print("toke ${state.token}");
        return NewLogin();
      }
      return Scaffold(
        body: Center(
          child: Image(
            width: 150,
            height: 150,
            image: AssetImage('assets/images/logobank.png'),
          ),
        ),
      );
    });
  }
}
