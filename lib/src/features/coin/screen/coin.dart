import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({Key? key}) : super(key: key);

  @override
  _CoinScreenState createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: mainColor,
      //     statusBarIconBrightness: Brightness.light,
      //   ),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(mainRadius),
      //           bottomRight: Radius.circular(mainRadius))),
      //   backgroundColor: mainColor,
      //   toolbarHeight: 80,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     color: white,
      //     iconSize: 30,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "Coin",
      //     style: TextStyle(
      //       fontSize: 25,
      //       color: white,
      //       fontWeight: FontWeight.w900,
      //       //fontFamily: "PlayfairDisplay-VariableFont_wght"
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                APPBAR(context),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 70,
                          padding: EdgeInsets.only(left: 10),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: white,
                              )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 100,
                          height: 70,
                          child: Text(
                            "Coin",
                            style: TextStyle(
                                fontSize: 25,
                                color: white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 70,
                          padding: EdgeInsets.only(right: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 100),
                    width: MediaQuery.of(context).size.width - 70,
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(mainRadius),
                        color: white,
                        // boxShadow: [
                        //   BoxShadow(color: grey, offset: Offset(1, 1)),
                        // ]
                        ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(top: 15, left: 15),
                          width: MediaQuery.of(context).size.width - 70,
                          //color: csblack,
                          //child: Text("Accouont: 0887112932", style: TextStyle(fontSize: 15, color: Colors.blue, ),),
                        )),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 70,
                          //color: mainColor,
                          child: Text(
                            "100 Coin",
                            style: TextStyle(
                                fontSize: 30,
                                color: csblack,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          width: MediaQuery.of(context).size.width - 70,
                          //color: grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red.shade600,
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
