
import 'package:anakut_bank/src/features/account/model/account_model.dart';
import 'package:anakut_bank/src/features/account/screen/fri_namecard.dart';
import 'package:anakut_bank/src/features/account/screen/scan.dart';
import 'package:anakut_bank/src/features/account/screen/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:share_plus/share_plus.dart';

import 'edit_namcard.dart';
import 'mycontact.dart';

class NameCardScreen extends StatefulWidget {
  //const NameCardScreen({Key? key}) : super(key: key);
  AccountModel accountModel;
  NameCardScreen(this.accountModel);

  @override
  State<NameCardScreen> createState() => _NameCardScreenState();
}

class _NameCardScreenState extends State<NameCardScreen> {
  bool status = false;
  String show = "Off";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          elevation: 0,
          backgroundColor: mainColor,
          title: Text("My Namecard"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanNameCard()));
                },
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 30,
                )),
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: Image(
                  width: 30,
                  height: 30,
                  image: AssetImage("assets/images/share-link.png")),
              onTap: () {
                Share.share('Hey! Share your namecard with Anakut Bank',
                    subject: 'My NameCard');
              },
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(children: [
          // SizedBox(height: 10,),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    // color: mainColor,
                    child: FlipCard(
                      fill: Fill
                          .fillBack, // Fill the back side of the card to make in the same size as the front.
                      direction: FlipDirection.HORIZONTAL,
                      front: Stack(children: [
                        Image(
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                            image: AssetImage('assets/images/myname (2).jpg')),
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: mainColor,
                              border: Border.all(color: white, width: 2),
                              //image: DecorationImage(image: AssetImage("assets/images/pf.jpg"))
                            ),
                            child: Center(
                                child: Text(
                              'P',
                              style: TextStyle(
                                  fontSize: 50, color: white, fontWeight: bold),
                            )),
                          ),
                        ),
                      ]),
                      back: Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          //color: mainColor,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(color: white,
                              //borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  blurRadius: 30,
                                  offset: Offset(5, -5),
                                )
                              ]),
                          child: Stack(
                            children: [
                              Center(
                                child: Flexible(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    //color: mainColor,
                                    //padding: EdgeInsets.all(30),
                                    // child: QrImage(
                                    //   data: "",
                                    // ),
                                  ),
                                ),
                              ),
                              Container(
                                  //margin: EdgeInsets.only(top: 10),
                                  alignment: Alignment.bottomCenter,
                                  width: MediaQuery.of(context).size.width,
                                  //height: 200,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/qrcard.png"))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Text(
                          "My Information",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: bold,
                              color: Color.fromARGB(255, 10, 82, 189)),
                        ),
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 10),
                            child: Text("See all"),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            //color: mainColor,
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              width: 40,
                              height: 18.0,
                              valueFontSize: 10.0,
                              toggleSize: 10.0,
                              value: status,
                              borderRadius: 30.0,
                              //padding: 8.0,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  status = val;
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                status == false
                    ? FriendNameCard()
                    : Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 30,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: white,
                                    border:
                                        Border.all(color: Colors.grey.shade100),
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
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'kh'),
                                            ),
                                          )),
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              backgroundImage: NetworkImage(
                                                  'https://firebasestorage.googleapis.com/v0/b/newonecam-53e7c.appspot.com/o/user%20(1).png?alt=media&token=c4dafa52-3e22-4514-9482-874bd4dde42d'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.grey.shade100,
                                    ),
                                   // data("Username", widget.accountModel.firstname! + " "+widget.accountModel.lastname!),
                                    Container(
                                      height: 1,
                                      color: Colors.grey.shade100,
                                    ),
                                    data("Gender", widget.accountModel.gender!),
                                    Container(
                                      height: 1,
                                      color: Colors.grey.shade100,
                                    ),
                                   // data("Date of Birth", widget.accountModel.date_of_birth!),
                                    drawer(),
                                    data("Job", "Student"),
                                    drawer(),
                                    data("Height", "1.68"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Education",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'kh',
                                        fontWeight: bold,
                                        color: Colors.blue.shade800),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width - 30,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: white,
                                    border:
                                        Border.all(color: Colors.grey.shade100),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    data("Primary School",
                                        "Anuwat Primary School"),
                                    drawer(),
                                    data("High School", "Chihe High School"),
                                    drawer(),
                                    data("University", "RUPP"),
                                    drawer(),
                                    Container(
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            child: Text(
                                              "Major",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'kh'),
                                            ),
                                          )),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  "Information Technology Engineer",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: 'kh')),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Contact",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'kh',
                                        fontWeight: bold,
                                        color: Colors.blue.shade800),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width - 30,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: white,
                                    border:
                                        Border.all(color: Colors.grey.shade100),
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
                                              "Phone number",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'kh'),
                                            ),
                                          )),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Text("0887112932",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: 'kh')),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    drawer(),
                                    data("Telegram", "0887112932"),
                                    drawer(),
                                    data("Facebook", "Peanh Kime"),
                                    drawer(),
                                    data("Instragram", "_kime168"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ))
        ]),
        floatingActionButton: Container(
            child: status == false
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.16,
                    height: MediaQuery.of(context).size.width * 0.16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff48BD00),
                    ),
                    child: Icon(
                      Icons.add,
                      color: white,
                      size: 40,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFF3E61),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff48BD00),
                        ),
                        child: Icon(
                          Icons.add,
                          color: white,
                          size: 40,
                        ),
                      )
                    ],
                  ))
        // floatingActionButton: Container(
        //   height: 45,
        //   width: MediaQuery.of(context).size.width,
        //   margin: EdgeInsets.only(left: 30),
        //   decoration: BoxDecoration(
        //     color: Color(0xffFEF2D5).withOpacity(0.5),
        //   ),
        //   child: Row(
        //     children: [
        //       Expanded(
        //           child: Container(
        //         child: Icon(
        //           Icons.qr_code_scanner,
        //           size: 35,
        //           color: Color(0xff7F0194),
        //         ),
        //       )),
        //       Expanded(
        //           child: Container(
        //         child: Icon(
        //           Icons.add,
        //           size: 35,
        //           color: Color.fromARGB(255, 29, 155, 12),
        //         ),
        //       )),
        //       Expanded(
        //           child: Container(
        //         child: Icon(
        //           Icons.share,
        //           size: 35,
        //           color: Color.fromARGB(255, 6, 68, 150),
        //         ),
        //       ))
        //     ],
        //   ),
        // ),
        );
  }
}
