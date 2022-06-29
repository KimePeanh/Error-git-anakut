import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/login/screen/googleSign.dart';
import 'package:anakut_bank/src/features/login/screen/loginScreen.dart';
import 'package:anakut_bank/src/features/register/screen/register_form.dart';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cf_passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                children: <Widget>[
                  SafeArea(
                      child: Container(
                          padding: EdgeInsets.only(top: 15),
                          width: 150,
                          height: 150,
                          child: Image(
                              width: 150,
                              height: 150,
                              image: AssetImage("assets/images/logobank.png")))),
                  Container(
                    width: 295,
                    child: Text(
                      "Welcome to Anakut Bank Plc",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: csblack,
                          fontFamily: 'kh'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: Text(
                      " Sign up to continue...",
                      style: TextStyle(
                          fontSize: 16, color: grey, fontFamily: 'kh'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RegisterForm(),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 1.5,
                        color: grey,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text("Signin with"),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 1.5,
                        color: grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: BTGoogle(),
                        onTap: () {
                          Signin();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: BTfacebook(),
                        onTap: () {
                         // singout();
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Flexible(
                      child: SizedBox(
                    height: 5,
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: InkWell(
          child: Text(
            AppLocalizations.of(context)!.translate("have acc")!,
            style: TextStyle(fontFamily: 'kh', color: grey, fontWeight: bold),textScaleFactor: 1.1,
          ),
          onTap: () {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
    );
  }
   Future singout() async {
    await GoogleSignInApi.logout();
  }

  Future Signin() async {
  final user =  await GoogleSignInApi.login();

    print(user!.displayName.toString());
    //print(user.serverAuthCode!.codeUnits.toString());
    print(user.photoUrl.toString());
  }
}
