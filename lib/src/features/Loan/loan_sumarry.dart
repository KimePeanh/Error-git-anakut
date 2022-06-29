import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LoanSumary extends StatefulWidget {
  const LoanSumary({Key? key}) : super(key: key);

  @override
  State<LoanSumary> createState() => _LoanSumaryState();
}

class _LoanSumaryState extends State<LoanSumary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Loan Summary",
              style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
              textScaleFactor: 1.1,
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.95,
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //         // color: grey,
          //         width: MediaQuery.of(context).size.width * 0.3,
          //         child: Padding(
          //           padding: EdgeInsets.all(10.0),
          //           child: new CircularPercentIndicator(
          //             radius: 110,
          //             lineWidth: 20,
          //             percent: 0.914,
          //             center: new Text("1116\$", style: TextStyle(fontFamily: 'kh', fontWeight: bold),textScaleFactor: 1.1,),
          //             progressColor: mainColor,
          //             backgroundColor: Color(0xff7F0194),
          //             circularStrokeCap: CircularStrokeCap.butt,
          //           ),
          //         ),
          //       ),
          //       Container(
          //         //color: csblack,
          //         width: MediaQuery.of(context).size.width * 0.65,
          //         height: MediaQuery.of(context).size.height * 0.13,
          //         //padding: EdgeInsets.only(right: 8),
          //         child: Row(
          //           children: [
          //             Expanded(
          //                 child: Container(
          //                   width: MediaQuery.of(context).size.width * 0.65-75,
          //               child: Column(
          //                 children: [
          //                   Expanded(
          //                       child: Container(
          //                         width: MediaQuery.of(context).size.width * 0.65-75,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       color: mainColor,
          //                     ),
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         Text("110\$",style: TextStyle(color: white,fontWeight: bold),textScaleFactor: 1.2,),
          //                         Text("Total Interest",style: TextStyle(color: white),textScaleFactor: 1,)
          //                       ],
          //                     ),
          //                   )),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   Expanded(
          //                       child: Container(
          //                          width: MediaQuery.of(context).size.width * 0.65-75,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(10),
          //                       color: Color(0xff7F0194),
          //                     ),
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         Text("1006\$",style: TextStyle(color: white,fontWeight: bold),textScaleFactor: 1.2,),
          //                         Text("Total pricipal",style: TextStyle(color: white,),textScaleFactor: 1,)
          //                       ],
          //                     ),
          //                   ))
          //                 ],
          //               ),
          //             )),
          //             SizedBox(
          //               width: 5,
          //             ),
          //             Container(
          //               width: 70,
          //               decoration: BoxDecoration(
          //                 color: Color(0xff03D925),
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         Text("12M",style: TextStyle(color: white,fontWeight: bold),textScaleFactor: 1.2,),
          //                         Text("Duration",style: TextStyle(color: white,),textScaleFactor: 1,)
          //                       ],
          //                     ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              children: <Widget>[
                Container(
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
                        style: TextStyle(fontFamily: 'kh', fontWeight: bold),
                        textScaleFactor: 1.1,
                      ),
                      progressColor: mainColor,
                      backgroundColor: Color(0xff7F0194),
                      circularStrokeCap: CircularStrokeCap.butt,
                    ),
                  ),
                ),
                SizedBox(
                  child: MediaQuery.of(context).size.height*0.15 >140?
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.15,
                      //height: 150,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.65-75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: mainColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("110\$",style: TextStyle(color: white,fontWeight: bold),textScaleFactor: 1,),
                                    Text("Total Interest",style: TextStyle(color: white),textScaleFactor: 1,)
                                  ],
                                ),
                              )),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                  child: Container(
                                     width: MediaQuery.of(context).size.width * 0.65-75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff7F0194),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1006\$",style: TextStyle(color: white,fontWeight: bold),textScaleFactor: 1,),
                                    Text("Total pricipal",style: TextStyle(color: white,),textScaleFactor: 1,)
                                  ],
                                ),
                              ))
                                  ],
                                ),
                              )),
                              
                              SizedBox(
                                width: 5,
                              ),

                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xff03D925),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "12M",
                                      style: TextStyle(
                                          color: white, fontWeight: bold),
                                      textScaleFactor: 1.2,
                                    ),
                                    Text(
                                      "Duration",
                                      style: TextStyle(
                                        color: white,
                                      ),
                                      textScaleFactor: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 5,),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffEE1724),
                          ),
                          child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0.00\$",
                                      style: TextStyle(
                                          color: white, fontWeight: bold),
                                      textScaleFactor: 1.2,
                                    ),
                                    Text(
                                      "Penalty",
                                      style: TextStyle(
                                        color: white,
                                      ),
                                      textScaleFactor: 1,
                                    )
                                  ],
                                ),
                        )
                      ],
                    ),
                  ): Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    //height: MediaQuery.of(context).size.height * 0.15,
                    height: 140,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.65-75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: mainColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("110\$",style: TextStyle(color: white,fontWeight: bold),textScaleFactor: 1,),
                                    Text("Total Interest",style: TextStyle(color: white),textScaleFactor: 1,)
                                  ],
                                ),
                              )),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                  child: Container(
                                     width: MediaQuery.of(context).size.width * 0.65-75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff7F0194),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1006\$",style: TextStyle(color: white,fontWeight: bold),textScaleFactor: 1,),
                                    Text("Total pricipal",style: TextStyle(color: white,),textScaleFactor: 1,)
                                  ],
                                ),
                              ))
                                  ],
                                ),
                              )),
                              
                              SizedBox(
                                width: 5,
                              ),

                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xff03D925),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "12M",
                                      style: TextStyle(
                                          color: white, fontWeight: bold),
                                      textScaleFactor: 1.2,
                                    ),
                                    Text(
                                      "Duration",
                                      style: TextStyle(
                                        color: white,
                                      ),
                                      textScaleFactor: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                        SizedBox(height: 5,),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffEE1724),
                          ),
                          child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "0.00\$",
                                      style: TextStyle(
                                          color: white, fontWeight: bold),
                                      textScaleFactor: 1.2,
                                    ),
                                    Text(
                                      "Penalty",
                                      style: TextStyle(
                                        color: white,
                                      ),
                                      textScaleFactor: 1,
                                    )
                                  ],
                                ),
                        )
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
