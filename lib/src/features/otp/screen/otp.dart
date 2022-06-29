import 'dart:async';

import 'package:anakut_bank/src/features/Auth/bloc/bloc/auth_bloc.dart';
import 'package:anakut_bank/src/features/login/screen/googleSign.dart';
import 'package:anakut_bank/src/features/login/screen/new_login.dart';
import 'package:anakut_bank/src/features/otp/bloc/bloc/resendotp_bloc.dart';
import 'package:anakut_bank/src/features/pin/sccreen/pin.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTP extends StatefulWidget {
  final String email;
  // final AccountModel accountModel;
  OTP(this.email);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(10.0),
  );
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  Future singout() async {
    await GoogleSignInApi.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: BlocListener<ResendotpBloc, ResendotpState>(
        listener: (context, state) {
          if (state is Resending) {
            print("object");
          } else if (state is Resentt) {
            errorSnackBar(
                text: "Code has been send to your email.", context: context);
          } else {
            print("Eroorrrrr");
          }
        },
        child: Center(
          child: Column(
            children: <Widget>[
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image(
                    width: 130,
                    height: 130,
                    image: AssetImage('assets/images/logobank.png')),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Enter your Verification Code we just sent to ${widget.email}.",
                  style: TextStyle(fontFamily: 'kh'),
                  textScaleFactor: 1.07,
                ),
              ),
              pinfield(),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't receive the Code? ",
                      style: TextStyle(fontFamily: 'kh'),
                      textScaleFactor: 1,
                    ),
                    InkWell(
                      child: Text(
                        "RESEND CODE",
                        style: TextStyle(fontFamily: 'kh', color: mainColor),
                        textScaleFactor: 1,
                      ),
                      onTap: () {
                        BlocProvider.of<ResendotpBloc>(context)
                            .add(ResendPress());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: InkWell(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Text(
            "Back to Login",
            style: TextStyle(color: grey),
            textScaleFactor: 1,
          ),
        ),
        onTap: () async {
          print("objdddddddddddddddddddddddddd");
          await GoogleSignInApi.logout();
          BlocProvider.of<AuthBloc>(context).add(LogoutPressed());
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NewLogin()));
        },
      ),
    );
  }

  Widget pinfield() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: PinPut(
        eachFieldWidth: 50.0,
        eachFieldHeight: 50.0,
        withCursor: true,
        fieldsCount: 4,
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        //eachFieldMargin: EdgeInsets.symmetric(horizontal: 20),
        onSubmit: (String pin) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PinScreen(pin)));
        },
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        pinAnimationType: PinAnimationType.scale,
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 20.0, height: 1, fontFamily: 'kh'),
      ),
    );
  }
}
