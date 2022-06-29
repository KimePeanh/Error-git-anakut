import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class KhrScreen extends StatefulWidget {
  const KhrScreen({Key? key}) : super(key: key);

  @override
  _KhrScreenState createState() => _KhrScreenState();
}

class _KhrScreenState extends State<KhrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            "Balance",
                            style: TextStyle(
                                fontSize: 25,
                                color: white,
                                fontWeight: FontWeight.bold,fontFamily: 'kh'),
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
                      //   BoxShadow(color: grey, offset: Offset(2, 2)),
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
                          "1,000,000 KHR",
                          style: TextStyle(
                              fontSize: 30,
                              color: csblack,
                              fontWeight: FontWeight.w900,fontFamily: 'kh'),
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
                                backgroundColor: Colors.red,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 12,
                              height: 12,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 12,
                              height: 12,
                              child: CircleAvatar(
                                backgroundColor: mainColor,
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
                      SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(mainRadius),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/transfer.png")),
                        ),
                        Text(
                          "Transfer",
                          style: TextStyle(fontSize: 12,fontFamily: 'kh'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/exchange.png")),
                        ),
                        Text(
                          "Exchnage",
                          style: TextStyle(fontSize: 12,fontFamily: 'kh'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/e-wallet.png")),
                        ),
                        Text(
                          "Top up",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                children:<Widget> [
                  Expanded(child: Container(
                    width: 100,
                    height: 20,
                    //color:  csblack,
                    child: Text("History", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,fontFamily: 'kh'),),
                    ),),
                  Expanded(child: Container(
                    alignment: Alignment.centerRight,
                    width: 100,
                    height: 20,
                    //color: mainColor,
                    child: Text("See more"),
                    ),
                    )
                ],
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                //color: grey,
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 2,
                        child: InkWell(
                          child: Container(
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
                        child: Icon(Icons.call_made_outlined,color: Colors.red,size: 27,)
                      ),
                    ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  transaction(context),
                            );
                          },
                        )),
                    Flexible(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          width: 700,
                          height: 60,
                          child: Text(
                            "Chea Kaknika",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          //color: csblack,
                        )),
                    Flexible(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.centerLeft,

                          width: 90,
                          height: 60,
                          child: Text(
                            "-5,000 KHR",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,fontFamily: 'kh'),
                          ),
                          //color: mainColor,
                        ))
                  ],
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => transaction(context),
                );
              },
            ),
            Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width-40,
                      color: Colors.grey.shade300,
                    ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              //color: grey,
              child: Row(
                children: <Widget>[
                  Flexible(
                      flex: 2,
                      child: Container(
                      //margin: EdgeInsets.only(top: 30.h),
                      width: 45.0,
                      height: 45.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        border: Border.all(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.call_received_rounded,color: Colors.green, size: 27,)
                      ),
                    ),),
                  Flexible(
                      flex: 8,
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          width: 700,
                          height: 60,
                          child: Text(
                            "Chea Kaknika",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,fontFamily: 'kh'),
                          ),
                          //color: csblack,
                        ),
                        onTap: () {},
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.centerLeft,

                        width: 90,
                        height: 60,
                        child: Text(
                          "10,000 KHR",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,fontFamily: 'kh'),
                        ),
                        //color: mainColor,
                      ))
                ],
              ),
            ),
        ],
      ),
    );
  }
}
