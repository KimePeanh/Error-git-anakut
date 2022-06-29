import 'package:anakut_bank/src/features/Edit%20Profile/screen/password_form.dart';
import 'package:anakut_bank/src/features/Edit%20Profile/screen/pf.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ChangePasswordScren extends StatefulWidget {
  const ChangePasswordScren({ Key? key }) : super(key: key);

  @override
  State<ChangePasswordScren> createState() => _ChangePasswordScrenState();
}

class _ChangePasswordScrenState extends State<ChangePasswordScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor,
        elevation: 0,
        toolbarHeight: 65,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: white,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("Security Setting", style: TextStyle(color: white,fontSize: 25, fontFamily: 'kh', fontWeight: bold),),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  ProfileWidget(),
                  SizedBox(height: 30,),
                  PasswordForm(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}