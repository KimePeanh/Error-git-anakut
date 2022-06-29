import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DepositDetail extends StatefulWidget {
  //const DepositDetail({Key? key}) : super(key: key);
  final int id;
  DepositDetail({required this.id});

  @override
  State<DepositDetail> createState() => _DepositDetailState();
}

class _DepositDetailState extends State<DepositDetail> {
  List<String> Listname = ["Peanh Kime", "Chea Kaknika", "Sous SreyLen"];
  List<String> ID = ["ANK1294783", "ANK5494421", "ANK2334783"];
  List<String> amount = ["Wed", "May 19", "May 18"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          "Deposit",
        ),
      ),
      body: Container(
        color: mainColor,
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height * 0.8,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    color: white),
              ),
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              height: height * 0.2,
              child: Container(
                width: width * 0.90,
                height: height * 0.2,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(4, 4),
                          blurRadius: 10)
                    ]),
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.2),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //   Container(
                      //   // color: grey,
                      //   width: MediaQuery.of(context).size.width * 0.3,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(10.0),
                      //     child: new CircularPercentIndicator(
                      //       radius: 110,
                      //       lineWidth: 20,
                      //       percent: 0.914,
                      //       center: new Text(
                      //         "1116\$",
                      //         style: TextStyle(fontFamily: 'kh', fontWeight: bold),
                      //         textScaleFactor: 1.1,
                      //       ),
                      //       progressColor: mainColor,
                      //       backgroundColor: Color(0xff7F0194),
                      //       circularStrokeCap: CircularStrokeCap.butt,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: width * 0.9,
                        child: Container(
                          // color: grey,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: new CircularPercentIndicator(
                              radius: 110,
                              lineWidth: 20,
                              percent: 0.914,
                              center: new Text(
                                "1116\$",
                                style: TextStyle(
                                    fontFamily: 'kh', fontWeight: bold),
                                textScaleFactor: 1.1,
                              ),
                              progressColor: mainColor,
                              backgroundColor: Color(0xff7F0194),
                              circularStrokeCap: CircularStrokeCap.butt,
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              width: width * 0.9,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    )
                                  ]),
                            );
                          })
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: width * 0.9,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor,
        ),
        child: Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                'Withdraw',
                style: TextStyle(color: white, fontWeight: bold),
                textScaleFactor: 1.1,
              ),
            )),
            Container(
              width: 2,
              height: 50,
              color: Colors.white,
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                'Deposit',
                style: TextStyle(color: white, fontWeight: bold),
                textScaleFactor: 1.1,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
