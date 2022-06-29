import 'package:anakut_bank/src/features/account/model/account_model.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chnage_pin.dart';

class AccountScreen extends StatefulWidget {
  //const AccountScreen({Key? key}) : super(key: key);
  final AccountModel accountModel;
  AccountScreen({required this.accountModel});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
          "My Account",
          style: TextStyle(fontSize: 20, fontWeight: bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Text(
                              "Profile Picture",
                              style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                            ),
                          )),
                          Container(
                            width: 50,
                            height: 50,
                            child: widget.accountModel.image_url! == null?
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/newonecam-53e7c.appspot.com/o/user%20(1).png?alt=media&token=c4dafa52-3e22-4514-9482-874bd4dde42d'),
                            ): CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: NetworkImage(
                                  widget.accountModel.image_url!),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade100,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Text(
                              "Username",
                              style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                            ),
                          )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(widget.accountModel.firstname! + " "+ widget.accountModel.lastname!,
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'kh')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade100,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Text(
                              "Email",
                              style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                            ),
                          )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(widget.accountModel.email.toString(),
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'kh')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade100,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Text(
                              "Gender",
                              style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                            ),
                          )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(widget.accountModel.gender.toString(),
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'kh')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey.shade100,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Text(
                              "Date of Birth",
                              style: TextStyle(fontSize: 17, fontFamily: 'kh'),
                            ),
                          )),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                  widget.accountModel.date_of_birth.toString(),
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'kh')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 30,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(2,4),
                          ),
                        ],
                      color: white,
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Text("Change Pin",
                            style: TextStyle(fontSize: 17, fontFamily: 'kh')),
                      )),
                      Container(
                        width: 40,
                        height: 40,
                        child: Image(
                          image: AssetImage("assets/images/password.png"),),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePin()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
