import 'package:anakut_bank/src/features/account/bloc/pinbloc/bloc/resetpin_bloc.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/menu/screen/newMenu.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'accountScreen.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({Key? key}) : super(key: key);

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(15.0),
  );
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Change Pin",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Center(
            child: Column(
              children: <Widget>[
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image(
                    width: 120,
                    height: 120,
                    image: AssetImage('assets/images/logobank.png'),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Enter your old PIN",
                    style: TextStyle(fontFamily: 'kh'),
                    textScaleFactor: 1.1,
                  ),
                ),

                //SizedBox(height: 20,),
                pinfield(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   alignment: Alignment.center,
      //   height: 50,
      //   color: mainColor,
      //   child: Text("Save", style: TextStyle(fontFamily: 'kh', color: white, fontWeight: bold),textScaleFactor: 1.25,),
      // ),
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
              context, MaterialPageRoute(builder: (context) => NewPin(pin)));
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

class NewPin extends StatefulWidget {
  final String oldpin;
  NewPin(this.oldpin);

  @override
  State<NewPin> createState() => _NewPinState();
}

class _NewPinState extends State<NewPin> {
  String pinn = "";
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(15.0),
  );
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Change Pin",
        ),
      ),
      body: BlocListener<ResetpinBloc, ResetpinState>(
        listener: (context, state) {
          if (state is Resetting) {
            loadingDialogs(context);
          } else if (state is ErrorReset) {
            Navigator.of(context).pop();
            errorSnackBar(text: state.error.toString(), context: context);
          } else {
            Navigator.of(context).pop();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MenuSideScreen()));
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Center(
              child: Column(
                children: <Widget>[
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image(
                      width: 120,
                      height: 120,
                      image: AssetImage('assets/images/logobank.png'),
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "Enter your New PIN",
                      style: TextStyle(fontFamily: 'kh'),
                      textScaleFactor: 1.1,
                    ),
                  ),

                  //SizedBox(height: 20,),
                  pinfield(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          color: mainColor,
          child: Text(
            "Save",
            style: TextStyle(fontFamily: 'kh', color: white, fontWeight: bold),
            textScaleFactor: 1.25,
          ),
        ),
        onTap: () {
          BlocProvider.of<ResetpinBloc>(context)
              .add(ResetPressed(old_pin: widget.oldpin, new_pin: pinn));
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
          setState(() {
            pinn = pin;
          });
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
