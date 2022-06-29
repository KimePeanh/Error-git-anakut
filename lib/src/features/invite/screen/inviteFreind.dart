import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          elevation: 0,
          toolbarHeight: 65,
          backgroundColor: mainColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: white,
                size: 30,
              )),
          title: Text(
            "Invite and Earn",
            style: TextStyle(
                fontSize: 25,
                color: white,
                fontWeight: FontWeight.bold,
                fontFamily: 'kh'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                AspectRatio(
                  aspectRatio: 17/5,
                  child: Container(
                    width: 150,
                    height: 150,
                    //color: mainColor,
                    child: Image(image: AssetImage("assets/images/logobank.png")),
                    ),
                ),
                Text("Invite a friend earn up to 10 point",style: TextStyle(fontSize: 20,fontFamily: 'kh'),),
                SizedBox(height: 30,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 100,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                  ),
                  child: Text("SHARE REFERRAL LINK", style: TextStyle(color: white, fontSize: 18, fontFamily: 'kh'),),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 100,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff7F0194),
                  ),
                  child: Text("COPY REFERRAL LINK", style: TextStyle(color: white, fontSize: 18, fontFamily: 'kh'),),
                )
              ],
            ),
          ),
        ));
  }
}
