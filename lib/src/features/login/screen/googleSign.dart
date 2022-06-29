import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/login/bloc/bloc/index.dart';
import 'package:anakut_bank/src/features/pin/sccreen/pin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

LoginBloc loginBloc = LoginBloc();

class GoogleSignInApi {
  static final _googlesignin = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() =>
      _googlesignin.signIn().then((result) {
        result!.authentication.then((googleKey) {
          print(googleKey.accessToken);
          loginBloc
              .add(GoogleloginPress(token: googleKey.accessToken!.toString()));
          print(googleKey.idToken);
          print(_googlesignin.currentUser!.displayName);
        }).catchError((err) {
          print('inner error');
        });
      }).catchError((err) {
        print('error occured');
      });
  // static Future<GoogleSignInAccount?> login(
  //     String state, BuildContext context) async {
  //   try {
  //     _googlesignin.signIn();
  //     print("susd");
  //     if (await _googlesignin.isSignedIn()) {
  //       print(_googlesignin.clientId);
  //       print(_googlesignin.scopes.toString());
  //       print(_googlesignin.currentUser.toString());
  //       if (state == "login") {
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => HomeScreen('')));
  //       } else {
  //         // Navigator.pushReplacement(
  //         //     context, MaterialPageRoute(builder: (context) => PinScreen()));
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  static Future<GoogleSignInAccount?> logout() => _googlesignin.signOut();
}
