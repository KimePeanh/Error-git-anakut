import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/pin/bloc/bloc/setpin_bloc.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinScreen extends StatefulWidget {
  //const PinScreen({Key? key}) : super(key: key);
  final String otp;
  PinScreen(this.otp);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  //SetpinBloc setpinBloc = SetpinBloc();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(15.0),
  );
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  @override
  void initState() {
    // setpinBloc = SetpinBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SetpinBloc, SetpinState>(
      listener: (context, state) {
        if (state is SettingPin) {
          loadingDialogs(context);
        } else if (state is ErrorSet) {
          errorSnackBar(text: state.error.toString(), context: context);
        } else {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen('')));
        }
      },
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  //color: csblack,
                  width: MediaQuery.of(context).size.width,
                  child: Image(image: AssetImage("assets/images/Shape.png")),
                ),
                //SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: AspectRatio(
                      aspectRatio: 14 / 4,
                      child: Container(
                        //margin: EdgeInsets.only(top: 50),
                        child: Image(
                          image: AssetImage("assets/images/logobank.png"),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Please set your 4 digit PIN",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'kh'),
            ),
            SizedBox(
              height: 40,
            ),
            pinfield(),
          ],
        ),
      ),
    ));
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
          //setpinBloc.add(SetPinPress(pin: pin, otp: widget.otp));
          BlocProvider.of<SetpinBloc>(context)
              .add(SetPinPress(pin: pin, otp: widget.otp));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => HomeScreen(pin)));
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
