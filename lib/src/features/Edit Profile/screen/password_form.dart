import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  late GlobalKey<FormState> _key = GlobalKey<FormState>();
  late TextEditingController? _oldpass = TextEditingController();
  late TextEditingController? _newpass = TextEditingController();
  late TextEditingController? _cfpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _oldpass,
                decoration: InputDecoration(
                  hintText: "Current password",
                  hintStyle: TextStyle(fontFamily: 'kh'),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _newpass,
                decoration: InputDecoration(
                  hintText: "New password",
                  hintStyle: TextStyle(fontFamily: 'kh'),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _cfpass,
                decoration: InputDecoration(
                  hintText: "Confirm password",
                  hintStyle: TextStyle(fontFamily: 'kh'),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 120,),
              BTLog(context, "Done"),
            ],
          ),
        ),
      ),
    );
  }
}
