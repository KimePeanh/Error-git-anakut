import 'dart:ui';

import 'package:anakut_bank/src/features/Edit%20Profile/screen/edit_profile.dart';
import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import '../../../app_localiztion.dart';
import '../../features/language/screen/languages.dart';

HomeScreen homeScreen = HomeScreen("");

Widget BTLog(BuildContext context, String btname) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width - 120,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mainRadius),
        color: mainColor,
        boxShadow: [
          BoxShadow(
            color: grey,
            offset: Offset(0, 1),
          )
        ]),
    child: Text(
      btname,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: white,
          fontFamily: 'kh'),
    ),
  );
}

Widget BTGoogle() {
  return Container(
    width: 70,
    height: 45,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mainRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
          )
        ]),
    child: Image(
        width: 30, height: 30, image: AssetImage('assets/images/google.png')),
  );
}

Widget BTfacebook() {
  return Container(
    width: 70,
    height: 45,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mainRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
          )
        ]),
    child: Image(
        width: 30, height: 30, image: AssetImage('assets/images/facebook.png')),
  );
}

Widget profile() {
  return Container(
    width: 65,
    height: 65,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: AssetImage("assets/images/pf.jpg"),
    ),
  );
}

@override
Size get preferredSize => const Size.fromHeight(200.0);
Widget APPBAR(BuildContext context) {
  return new SizedBox.fromSize(
    size: preferredSize,
    child: new LayoutBuilder(builder: (context, constraint) {
      final width = constraint.maxWidth * 8;
      return new ClipRect(
        child: new OverflowBox(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
          child: new SizedBox(
            width: width,
            height: width - 10,
            child: new Padding(
              padding: new EdgeInsets.only(
                  bottom: width / 2 - preferredSize.height / 2),
              child: new DecoratedBox(
                decoration: new BoxDecoration(
                  color: mainColor,
                  shape: BoxShape.circle,
                  // boxShadow: [
                  //   new BoxShadow(color: Colors.grey.shade400, blurRadius: 10.0)
                  // ],
                ),
              ),
            ),
          ),
        ),
      );
    }),
  );
}

Widget pff() {
  return Container(
    //margin: EdgeInsets.only(top: 30.h),
    width: 65.0,
    height: 65.0,
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage("assets/images/pf.jpg"),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(Radius.circular(80)),
      border: Border.all(
        color: white,
        width: 1.0,
      ),
    ),
  );
}

Widget appbar(BuildContext context, String tittle) {
  return SafeArea(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(mainRadius),
            bottomRight: Radius.circular(mainRadius)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 80,
            padding: EdgeInsets.only(left: 10),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
              color: white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 100,
            height: 80,
            child: Text(
              tittle,
              style: TextStyle(
                  fontSize: 25,
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'kh'),
            ),
          ),
          Container(
            width: 50,
            height: 80,
          ),
        ],
      ),
    ),
  );
}

Widget transaction(BuildContext context) {
  return new BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: new AlertDialog(
      content: Flexible(
        child: Container(
          //height: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: 30.h),
                      width: 45.0,
                      height: 45.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        border: Border.all(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.call_made_outlined,
                            color: Colors.red,
                            size: 27,
                          )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Transfer to CHEA KAKNIKA",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: bold,
                          color: Colors.red,
                          fontFamily: 'kh'),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 40,
              ),
              Flexible(
                  child: Container(
                height: 20,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Transaction ID :",
                        style: TextStyle(
                            fontSize: 12, fontWeight: bold, fontFamily: 'kh'),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "225389245051",
                        style: TextStyle(fontSize: 12, fontFamily: 'kh'),
                      ),
                    )),
                  ],
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: Container(
                height: 20,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Transaction Date :",
                        style: TextStyle(
                            fontSize: 12, fontWeight: bold, fontFamily: 'kh'),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "18-02-2022  3:25 PM",
                        style: TextStyle(fontSize: 12, fontFamily: 'kh'),
                      ),
                    )),
                  ],
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: Container(
                height: 20,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Amount :",
                        style: TextStyle(
                            fontSize: 12, fontWeight: bold, fontFamily: 'kh'),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "2.00 USD",
                        style: TextStyle(
                            fontSize: 12, color: Colors.red, fontFamily: 'kh'),
                      ),
                    )),
                  ],
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: Container(
                height: 20,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "From Account :",
                        style: TextStyle(
                            fontSize: 12, fontWeight: bold, fontFamily: 'kh'),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Peanh Kime",
                        style: TextStyle(fontSize: 12, fontFamily: 'kh'),
                      ),
                    )),
                  ],
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Flexible(
                  child: Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.save_alt,
                            color: Colors.red,
                          ),
                          Text("Save",
                              style: TextStyle(fontSize: 12, fontFamily: 'kh')),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.rotate_right,
                            color: Colors.red,
                          ),
                          Text("Repeat",
                              style: TextStyle(fontSize: 12, fontFamily: 'kh')),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.more_vert,
                            color: Colors.red,
                          ),
                          Text("More",
                              style: TextStyle(fontSize: 12, fontFamily: 'kh')),
                        ],
                      ),
                    )),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    ),
  );
}

Widget QR() {
  return new BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: new AlertDialog(
      //title: const Text('Scan to pay me'),
      content: Container(
        height: 300,
        child: new Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Scan to pay me',
                  style: TextStyle(
                      color: csblack,
                      fontWeight: bold,
                      fontSize: 18,
                      fontFamily: 'kh'),
                ),
              ),
              Expanded(
                child: Image(
                    width: 200,
                    height: 200,
                    image: AssetImage("assets/images/Capture.PNG")),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save_alt,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Save image"),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Share"),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget wallet(BuildContext context, String num, String mon, String imagepath) {
  return Container(
    //alignment: Alignment.center,
    width: MediaQuery.of(context).size.width - 20,
    height: 80,
    child: Card(
      semanticContainer: true,
      //color: csblack,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Center(
        child: ListTile(
          title: Text(
            num,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'kh'),
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: 5),
            height: 25,
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.translate("balance")! + " :",
                  style: TextStyle(fontSize: 15, color: grey, fontFamily: 'kh'),
                ),
                Text(
                  mon,
                  style: TextStyle(
                      fontSize: 15, color: Colors.green, fontFamily: 'kh'),
                )
              ],
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    ),
  );
}

Widget component(String imagepath, String text) {
  return Container(
    child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Image(width: 30, height: 30, image: AssetImage(imagepath)),
    Text(text),
  ],
    ),
  );
}

Widget menu(String imagepath, String text) {
  return Container(
    child: Column(
      children: [
        Image(width: 50, height: 50, image: AssetImage(imagepath)),
        SizedBox(
          height: 4,
        ),
        Text(text,
            style: TextStyle(
                fontSize: 14,
                //fontWeight: FontWeight.bold,
                fontFamily: 'kh'))
      ],
    ),
  );
}

Widget transfertype(BuildContext context, String imagePath, String title) {
  return Container(
    width: MediaQuery.of(context).size.width - 30,
    height: 60,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: ListTile(
          leading: Image(width: 40, height: 40, image: AssetImage(imagePath)),
          title: Text(title),
        ),
      ),
    ),
  );
}

Widget sidemenu(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width - 90,
    color: white,
    child: Column(
      children: <Widget>[
        InkWell(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width - 80,
            height: 160,
            color: mainColor,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                pff(),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'kh'),
                    ),
                    Text(
                      "0887112932",
                      style: TextStyle(
                          fontSize: 15, color: Colors.white, fontFamily: 'kh'),
                    )
                  ],
                ),
              ],
            ),
          ),
          // onTap: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => AccountScreen()));
          // },
        ),
        Container(
          width: MediaQuery.of(context).size.width - 80,
          height: 1,
          color: white,
        ),
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width - 80,
            height: MediaQuery.of(context).size.height - 191,
            color: white,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        width: 50,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.home,
                            color: mainColor,
                          ),
                          iconSize: 25,
                        ),
                      )),
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate("home")!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      //fontWeight: FontWeight.bold,
                                      color: csblack,
                                      fontFamily: 'kh'))))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        width: 50,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.qr_code),
                          iconSize: 25,
                          color: Colors.blueGrey,
                        ),
                      )),
                      Flexible(
                          child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("myqr")!,
                                style: TextStyle(
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                    color: csblack,
                                    fontFamily: 'kh'))),
                        onTap: () {},
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        width: 50,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          iconSize: 25,
                          color: Colors.pink,
                        ),
                      )),
                      Flexible(
                          child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("editpf")!,
                                style: TextStyle(
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                    color: csblack,
                                    fontFamily: 'kh'))),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfileScreen()));
                        },
                      )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        width: 50,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.language),
                          iconSize: 25,
                          color: Colors.blue,
                        ),
                      )),
                      Flexible(
                          child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("lang")!,
                                style: TextStyle(
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold,
                                    color: csblack,
                                    fontFamily: 'kh'))),
                        onTap: () {
                          languageModal(context);
                        },
                      ))
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Flexible(
                            child: Container(
                          width: 50,
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.settings),
                            iconSize: 25,
                            color: Colors.purple,
                          ),
                        )),
                        Flexible(
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("setting")!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: csblack,
                                        fontFamily: 'kh'))))
                      ],
                    ),
                  ),
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => UserAccountScreen()));
                  // },
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        width: 50,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                          iconSize: 25,
                        ),
                      )),
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate("contact us")!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      //fontWeight: FontWeight.bold,
                                      color: csblack,
                                      fontFamily: 'kh'))))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        width: 50,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.help_center),
                          iconSize: 25,
                          color: Colors.orange,
                        ),
                      )),
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate("help")!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      //fontWeight: FontWeight.bold,
                                      color: csblack,
                                      fontFamily: 'kh'))))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Flexible(
                          child: Container(
                        width: 50,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.logout),
                          iconSize: 25,
                          color: Colors.red,
                        ),
                      )),
                      Flexible(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate("logout")!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      //fontWeight: FontWeight.bold,
                                      color: csblack,
                                      fontFamily: 'kh'))))
                    ],
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     alignment: Alignment.bottomCenter,
                //     padding: EdgeInsets.only(left: 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Flexible(
                //             child: Container(
                //                 padding:
                //                     EdgeInsets.only(left: 10, bottom: 15),
                //                 alignment: Alignment.bottomCenter,
                //                 child: Text("Version " + versionn,
                //                     style: TextStyle(
                //                         fontSize: 15,
                //                         fontWeight: FontWeight.bold,
                //                         color: csblack))))
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
