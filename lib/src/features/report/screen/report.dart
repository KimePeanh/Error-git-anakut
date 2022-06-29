import 'package:anakut_bank/src/features/home/screen/menu.dart';
import 'package:anakut_bank/src/features/mybank/screen/widget.dart';
import 'package:anakut_bank/src/features/report/screen/widget.dart';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String dropdownValue = 'Today';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            APPBAR(context),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: 65,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      child: Text(
                        "Report",
                        style: TextStyle(color: white),
                        textScaleFactor: 1.2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.50,
              child: Container(
                padding: EdgeInsets.all(8),
                //padding: EdgeInsets.only(top: 100),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.50,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.2),
                        offset: Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 3,
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        children: [
                          Text(
                            "Summary ",
                            style: TextStyle(fontFamily: 'kh'),
                            textScaleFactor: 1.1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                            value: dropdownValue,
                            elevation: 18,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            underline: Container(
                              height: 1,
                              color: Colors.grey.shade300,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Today',
                              'This Week',
                              'This Month',
                              'This Year'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$0.00",
                                  style: TextStyle(
                                      fontWeight: bold, color: Colors.blue),
                                  textScaleFactor: 1.5,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Loan",
                                  style: TextStyle(),
                                  textScaleFactor: 1.3,
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$0.00",
                                  style: TextStyle(
                                      fontWeight: bold, color: Colors.blue),
                                  textScaleFactor: 1.5,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Top Up",
                                  style: TextStyle(),
                                  textScaleFactor: 1.3,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$0.00",
                                  style: TextStyle(
                                      fontWeight: bold, color: Colors.blue),
                                  textScaleFactor: 1.5,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Transfer",
                                  style: TextStyle(),
                                  textScaleFactor: 1.3,
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$0.00",
                                  style: TextStyle(
                                      fontWeight: bold, color: Colors.blue),
                                  textScaleFactor: 1.5,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Bill Payment",
                                  style: TextStyle(),
                                  textScaleFactor: 1.3,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        mainColor.withOpacity(0.3),
                        mainColor.withOpacity(0.7)
                      ],
                      // begin: const FractionalOffset(0.0, 0.0),
                      // end: const FractionalOffset(0.8, 0.0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$0.00",
                      style: TextStyle(fontWeight: bold, color: Colors.blue),
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Total",
                      style: TextStyle(color: Colors.black, fontWeight: bold),
                      textScaleFactor: 1.5,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Color(0xffFEF2D5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      //width: MediaQuery.of(context).size.width * 0.8,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Last Transaction",
                            style: TextStyle(),
                            textScaleFactor: 0.9,
                          ),
                          Text(
                            "See All",
                            style: TextStyle(),
                            textScaleFactor: 0.9,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
