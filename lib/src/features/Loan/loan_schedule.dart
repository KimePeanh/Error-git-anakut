import 'package:anakut_bank/src/features/Loan/loan_payment.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../app_localiztion.dart';

class LoanSchedule extends StatefulWidget {
  const LoanSchedule({Key? key}) : super(key: key);

  @override
  State<LoanSchedule> createState() => _LoanScheduleState();
}

class _LoanScheduleState extends State<LoanSchedule> {
  String dropdownValue = 'All';
  var View = ["All", "Paid", "Unpaid"];
  String view = "All";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Loan Detail",
                        style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
                        textScaleFactor: 1.1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: PopupMenuButton(
                        onSelected: (c) {
                          setState(() {
                            view = c.toString();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              view,
                              style: TextStyle(fontWeight: bold),
                              textScaleFactor: 1,
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        itemBuilder: (context) => View.map(
                                (c) => PopupMenuItem(value: c, child: Text(c)))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: 12,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.only(left: 10, right: 10),
            //         child: InkWell(
            //           child: Container(
            //             margin: EdgeInsets.only(bottom: 10),
            //             width: MediaQuery.of(context).size.width * 0.9,
            //             height: MediaQuery.of(context).size.height * 0.1,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: white,
            //                 border: Border.all(color: mainColor.withOpacity(0.1)),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: grey.withOpacity(0.2),
            //                     offset: Offset(2, 2),
            //                     blurRadius: 1,
            //                   ),
            //                   BoxShadow(
            //                     color: white,
            //                     offset: -Offset(2, 2),
            //                     blurRadius: 1,
            //                   )
            //                 ]),
            //             child: Row(
            //               children: [
            //                 Expanded(
            //                     child: Container(
            //                   padding: EdgeInsets.all(8),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: <Widget>[
            //                       Container(
            //                           alignment: Alignment.centerLeft,
            //                           child: Text(
            //                             "25-01-2021",
            //                             style: TextStyle(fontWeight: bold),
            //                             textScaleFactor: 1,
            //                           )),
            //                       Container(
            //                         alignment: Alignment.centerLeft,
            //                         child: Text(
            //                           "Principal   76.00\$",
            //                           style:
            //                               TextStyle(color: Color(0xff7F0194)),
            //                           textScaleFactor: 1,
            //                         ),
            //                       ),
            //                       Container(
            //                         alignment: Alignment.centerLeft,
            //                         child: Text(
            //                           "Interest     17.00\$",
            //                           style: TextStyle(color: mainColor),
            //                           textScaleFactor: 1,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 )),
            //                 Expanded(
            //                     child: Container(
            //                   padding: EdgeInsets.all(8),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: <Widget>[
            //                       Container(
            //                           alignment: Alignment.centerRight,
            //                           child: Text(
            //                             "Payment 93.00\$",
            //                             style: TextStyle(
            //                                 fontWeight: bold,
            //                                 color: Color(0xff00D408)),
            //                             textScaleFactor: 1,
            //                           )),
            //                       Container(
            //                         alignment: Alignment.centerRight,
            //                         child: Text(
            //                           "Balance   924.00\$",
            //                           style:
            //                               TextStyle(color: Color(0xffC6010D)),
            //                           textScaleFactor: 1,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ))
            //               ],
            //             ),
            //           ),
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => LoanPayment()));
            //           },
            //         ),
            //       );
            //     })
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.green.withOpacity(0.2),
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: grey.withOpacity(0.2),
                        //   offset: Offset(2, 2),
                        //   blurRadius: 1,
                        // ),
                        // BoxShadow(
                        //   color: white,
                        //   offset: -Offset(2, 2),
                        //   blurRadius: 1,
                        // )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color: Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                     // color: Colors.green.withOpacity(0.2),
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: grey.withOpacity(0.2),
                        //   offset: Offset(2, 2),
                        //   blurRadius: 1,
                        // ),
                        // BoxShadow(
                        //   color: white,
                        //   offset: -Offset(2, 2),
                        //   blurRadius: 1,
                        // )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-02-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color: Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.green.withOpacity(0.2),
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: grey.withOpacity(0.2),
                        //   offset: Offset(2, 2),
                        //   blurRadius: 1,
                        // ),
                        // BoxShadow(
                        //   color: white,
                        //   offset: -Offset(2, 2),
                        //   blurRadius: 1,
                        // )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color: Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.green.withOpacity(0.2),
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        // BoxShadow(
                        //   color: grey.withOpacity(0.2),
                        //   offset: Offset(2, 2),
                        //   blurRadius: 1,
                        // ),
                        // BoxShadow(
                        //   color: white,
                        //   offset: -Offset(2, 2),
                        //   blurRadius: 1,
                        // )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color: Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffEE1724).withOpacity(0.1),
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor,),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color: Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Penalty   5.00\$",
                                style: TextStyle(color: Colors.red, fontWeight:  bold),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoanPayment()));
                  showAlertDialogServicefee(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color:Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color:Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color:Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color:Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color:Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color:Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      border: Border.all(color: mainColor.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                        BoxShadow(
                          color: white,
                          offset: -Offset(2, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "25-01-2021",
                                  style: TextStyle(fontWeight: bold),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Principal   76.00\$",
                                style: TextStyle(color: Color(0xff7F0194)),
                                textScaleFactor: 1,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Interest     17.00\$",
                                style: TextStyle(color: mainColor),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Payment 93.00\$",
                                  style: TextStyle(
                                      fontWeight: bold,
                                      color: Color(0xff00D408)),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Balance   924.00\$",
                                style: TextStyle(color:Colors.blue),
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoanPayment()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialogServicefee(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Submit",style: TextStyle(color:  Color(0xffC6010D))),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Penalty",style: TextStyle(color:  Color(0xffC6010D)),),
      content: Container(
        height: 70,
       
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                labelText: "Amount",
                labelStyle: TextStyle(fontFamily: 'kh'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                  gapPadding: 10,
                ),
              ),
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return AppLocalizations.of(context)!.translate("phReq");
              //   }
              //   return null;
              // },
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
