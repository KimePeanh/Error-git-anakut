import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({Key? key}) : super(key: key);

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor,
        toolbarHeight: 65,
        elevation: 0,
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
        title: Text(
          "Upgrade Profile",
          style: TextStyle(
              fontSize: 25, color: white, fontFamily: 'kh', fontWeight: bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color(0xffFEF2D5),
              child: Text("Tell benefit when user upgrade profile",style: TextStyle(fontWeight: bold,fontSize: 18)),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              child: Text("Choose the country where your ID documentation was issued.", style: TextStyle(fontSize: 17, fontFamily: 'kh', ),),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              padding: EdgeInsets.only(left: 10,
              right: 10),
              height: 42,
              decoration: BoxDecoration(
                color: Color(0xffC4C4C4).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 45,
                    child: Image(
                      //height: 30,
                      image: AssetImage("assets/images/flag.png")),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: Container(
                    child: Text("Cambodia",style: TextStyle(fontSize: 17, fontFamily: 'kh'),),
                  )),
                  Container(
                    width: 50,
                    height: 42,
                    child: Icon(Icons.arrow_forward_ios),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              child: Text("Select your document type", style: TextStyle(fontSize: 17, fontFamily: 'kh', ),),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              height: 42,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 42,
                    child: Icon(Icons.airplanemode_on,color: white,),
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: Container(
                    child: Text("Passport",style: TextStyle(fontSize: 17, fontFamily: 'kh',color: white),),
                  )),
                  Container(
                    width: 50,
                    height: 42,
                    child: Icon(Icons.arrow_forward_ios,color: white,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              height: 42,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 42,
                    child: Icon(Icons.directions_car_rounded,color: white,),
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: Container(
                    child: Text("Driver License",style: TextStyle(fontSize: 17, fontFamily: 'kh',color: white),),
                  )),
                  Container(
                    width: 50,
                    height: 42,
                    child: Icon(Icons.arrow_forward_ios,color: white,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              height: 42,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 42,
                    child: Icon(Icons.badge_outlined,color: white,),
                  ),
                  SizedBox(width: 5,),
                  Expanded(child: Container(
                    child: Text("ID Card",style: TextStyle(fontSize: 17, fontFamily: 'kh',color: white),),
                  )),
                  Container(
                    width: 50,
                    height: 42,
                    child: Icon(Icons.arrow_forward_ios,color: white,),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}



