import 'package:anakut_bank/src/features/Auth/bloc/bloc/auth_bloc.dart';
import 'package:anakut_bank/src/features/account/bloc/bloc/account_bloc.dart';
import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/login/bloc/bloc/index.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/login/screen/googleSign.dart';
import 'package:anakut_bank/src/features/otp/screen/otp.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NewLogin extends StatefulWidget {
  //const NewLogin({Key? key}) : super(key: key);
  //final AccountModel accountModel;
  // NewLogin(this.accountModel);

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  Future<void> Delay() async {
    Future.delayed(Duration(seconds: 5));
  }

  String? email;

  @override
  void initState() {
    BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: mainColor,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, dynamic state) {
          if (state is Logging) {
            loadingDialogs(context);
          } else if (state is Googlelog) {
            if (state.loginResponModel.staus == "completed") {
              print(state.loginResponModel.staus);
                  BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
              BlocProvider.of<AuthBloc>(context).add(AuthenticationStarted(
                  token: state.loginResponModel.token,
                  ver: state.loginResponModel.staus));
              print(state.loginResponModel.token);
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen('')));
            } else {
              //print("sssssssssssssssssssssect");
              print(state.loginResponModel.token);
              BlocProvider.of<AuthBloc>(context).add(AuthenticationStarted(
                  token: state.loginResponModel.token,
                  ver: state.loginResponModel.staus));
              Navigator.of(context).pop();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OTP(email!)));
            }
          } else if (state is ErrorLogin) {
            print("hiiiiKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
            Navigator.of(context).pop();
            errorSnackBar(text: state.error, context: context);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 150,
                  height: 150,
                  image: AssetImage('assets/images/logobank.png')),
              SizedBox(
                height: 10,
              ),
              Text(
                "Anakut Bank Plc",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: csblack,
                    fontFamily: 'kh'),
                textScaleFactor: 1.4,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 35),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 30,
                        image: AssetImage('assets/images/google.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Continue with Google",
                      style: TextStyle(color: csblack, fontFamily: 'kh'),
                      textScaleFactor: 1,
                    )
                  ],
                ),
              ),
              onTap: () {
                Signin();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future Signin() async {
    final user = login();
  }

  Future singout() async {
    await GoogleSignInApi.logout();
  }

  final _googlesignin = GoogleSignIn();
  Future<GoogleSignInAccount?> login() => _googlesignin.signIn().then((result) {
        result!.authentication.then((googleKey) {
          print(googleKey.accessToken);
          BlocProvider.of<LoginBloc>(context)
              .add(GoogleloginPress(token: googleKey.accessToken!.toString()));
          // loginBloc
          //     .add(GoogleloginPress(token: googleKey.accessToken!.toString()));
          print(googleKey.idToken);
          setState(() {
            email = _googlesignin.currentUser!.email;
          });
          print(_googlesignin.currentUser!.authentication);
        }).catchError((err) {
          print(err.toString());
        });
      }).catchError((err) {
        print(err.toString());
      });
}
