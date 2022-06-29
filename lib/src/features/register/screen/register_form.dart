import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/pin/sccreen/pin.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../app_localiztion.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController? _firstNameController = TextEditingController();
  late TextEditingController? _lastNameController = TextEditingController();
  late TextEditingController? _emailController = TextEditingController();
  late TextEditingController? _passController = TextEditingController();
  late TextEditingController? _cfpassController = TextEditingController();
  late GlobalKey<FormState>? _key = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText:
                          AppLocalizations.of(context)!.translate("fname")!,
                      labelStyle: TextStyle(fontFamily: 'kh'),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                        gapPadding: 10,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.translate("phReq");
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText:
                          AppLocalizations.of(context)!.translate("lname")!,
                      labelStyle: TextStyle(fontFamily: 'kh'),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                        gapPadding: 10,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLocalizations.of(context)!.translate("phReq");
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                labelText: AppLocalizations.of(context)!.translate("email")!,
                labelStyle: TextStyle(fontFamily: 'kh'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.translate("phReq");
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
              controller: _passController,
              keyboardType: TextInputType.emailAddress,
              obscureText: show,
              decoration: InputDecoration(
                  isDense: true,
                  labelText: AppLocalizations.of(context)!.translate("pass")!,
                  labelStyle: TextStyle(fontFamily: 'kh'),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                    gapPadding: 10,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                        show = false;
                      });
                    },
                  )
                  ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.translate("phReq");
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
              controller: _cfpassController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                isDense: true,
                labelText: AppLocalizations.of(context)!.translate("cfpass")!,
                labelStyle: TextStyle(fontFamily: 'kh'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!.translate("phReq");
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width *0.7,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mainRadius),
                  color: mainColor,
                  boxShadow: [
                    BoxShadow(
                      color: grey,
                      offset: Offset(1, 1),
                    )
                  ]),
              child: Text(
               "Next",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: white,
                    fontFamily: 'kh'),
              ),
            ),
            onTap: () {
              if (_key!.currentState!.validate()) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PinScreen("")));
              }
            },
          ),
        ],
      ),
    );
  }
}
