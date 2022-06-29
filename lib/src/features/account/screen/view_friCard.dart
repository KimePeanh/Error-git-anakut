
import 'package:anakut_bank/src/features/account/screen/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'mycontact.dart';

class MyfriendCard extends StatefulWidget {
  const MyfriendCard({Key? key}) : super(key: key);

  @override
  State<MyfriendCard> createState() => _MyfriendCardState();
}

class _MyfriendCardState extends State<MyfriendCard> {
  Color save = Color(0xffFF7777);
  String textsave = "Saved";

  void chechsave() {
    if (textsave == "Saved") {
      setState(() {
        textsave = "Save";
        save = Colors.grey.withOpacity(0.5);
      });
    } else {
      setState(() {
        textsave = "Saved";
        save = Color(0xffFF7777);
      });
    }
  }

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
        title: Text("THOMAS SMITH"),
        actions: [
          Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/images/share-link.png")),
          Container(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    // color: mainColor,
                    child: Image(
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                        image: AssetImage('assets/images/friname.jpg')),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: white, width: 2),
                            color: mainColor,
                          ),
                          child: Text(
                            "TS",
                            style: TextStyle(
                                fontSize: 19,
                                color: white,
                                fontWeight: bold,
                                fontFamily: 'kh'),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "THOMAS SMITH",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Graphic Designer",
                                  style:
                                      TextStyle(fontSize: 16, color: mainColor),
                                ),
                              )
                            ],
                          ),
                        )),
                        InkWell(
                          child: Container(
                            width: 100,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: save,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              textsave,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: white,
                                  fontWeight: bold,
                                  fontFamily: 'kh'),
                            ),
                          ),
                          onTap: () {
                            chechsave();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  MyContact(),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Information",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: bold,
                          color: Color.fromARGB(255, 10, 82, 189)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                                  style:
                                      TextStyle(fontSize: 17, fontFamily: 'kh'),
                                ),
                              )),
                              Container(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
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
                        data("Username", "THOMAS SMITH"),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        data("Gender", "Male"),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        data("Date of Birth", "05-06-1998"),
                        drawer(),
                        data("Job", "Graphic Designer"),
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
                        border: Border.all(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        data("Primary School", "Anuwat Primary School"),
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
                                  style:
                                      TextStyle(fontSize: 17, fontFamily: 'kh'),
                                ),
                              )),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text("Information Technology Engineer",
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
                                  "Phone number",
                                  style:
                                      TextStyle(fontSize: 17, fontFamily: 'kh'),
                                ),
                              )),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text("0887112932",
                                      style: TextStyle(
                                          fontSize: 17, fontFamily: 'kh')),
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
          ))
        ],
      ),
      // floatingActionButton: Container(
      //   width: MediaQuery.of(context).size.width*0.15,
      //   height: MediaQuery.of(context).size.width*0.15,

      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: Color(0xff05228A),
      //   ),
      // ),
    );
  }
}
