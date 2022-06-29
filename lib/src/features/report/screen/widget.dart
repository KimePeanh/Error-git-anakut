import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class Reportmenu extends StatefulWidget {
  const Reportmenu({Key? key}) : super(key: key);

  @override
  State<Reportmenu> createState() => _ReportmenuState();
}

class _ReportmenuState extends State<Reportmenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Center(
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         width: MediaQuery.of(context).size.width*0.9,
      //         height: MediaQuery.of(context).size.height*0.11,
      //         child: Row(
      //           children: [
      //             Expanded(child: Container(
      //               decoration: BoxDecoration(
      //                 color: mainColor,
      //                 borderRadius: BorderRadius.circular(10),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.grey.shade300,
      //                     offset: Offset(4,4),
      //                     blurRadius: 15,
      //                     spreadRadius: 1
      //                   )
      //                 ]
      //               ),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   // Image(
      //                   //   height: MediaQuery.of(context).size.height*0.08,
      //                   //   image: AssetImage("assets/images/refinance.png")),
      //                   Text("LOAN",style: TextStyle(fontFamily: 'kh',fontWeight: bold,color: white),textScaleFactor: 1.2,)
      //                 ],
      //               ),
      //             )),
      //             SizedBox(width: 10,),
      //             Expanded(child: Container(
      //               decoration: BoxDecoration(
      //                 color: mainColor,
      //                 borderRadius: BorderRadius.circular(10),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.grey.shade300,
      //                     offset: Offset(4,4),
      //                     blurRadius: 15,
      //                     spreadRadius: 1
      //                   )
      //                 ]
      //               ),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   // Image(
      //                   //   height: MediaQuery.of(context).size.height*0.08,
      //                   //   image: AssetImage("assets/images/refinance.png")),
      //                   Text("TOP UP",style: TextStyle(fontFamily: 'kh',fontWeight: bold,color: white),textScaleFactor: 1.2,)
      //                 ],
      //               ),
      //             )),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 10,),
      //       Container(
      //         width: MediaQuery.of(context).size.width*0.9,
      //         height: MediaQuery.of(context).size.height*0.11,
      //         child: Row(
      //           children: [
      //             Expanded(child: Container(
      //               decoration: BoxDecoration(
      //                 color: mainColor,
      //                 borderRadius: BorderRadius.circular(10),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.grey.shade300,
      //                     offset:  const Offset(4,4),
      //                     blurRadius: 15,
      //                     spreadRadius: 1
      //                   ),
      //                   const BoxShadow(
      //                     color: Colors.white,
      //                     offset:  Offset(-4,-4),
      //                     blurRadius: 15,
      //                     spreadRadius: 1
      //                   )
      //                 ]
      //               ),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   // Image(
      //                   //   height: MediaQuery.of(context).size.height*0.08,
      //                   //   image: AssetImage("assets/images/refinance.png")),
      //                   Text("TRANSFER",style: TextStyle(fontFamily: 'kh',fontWeight: bold,color: white),textScaleFactor: 1.2,)
      //                 ],
      //               ),
      //             )),
      //             SizedBox(width: 10,),
      //             Expanded(child: Container(
      //               decoration: BoxDecoration(
      //                 color: mainColor,
      //                 borderRadius: BorderRadius.circular(10),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.grey.shade300,
      //                     offset: Offset(4,4),
      //                     blurRadius: 15,
      //                     spreadRadius: 1
      //                   )
      //                 ]
      //               ),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   // Image(
      //                   //   height: MediaQuery.of(context).size.height*0.08,
      //                   //   image: AssetImage("assets/images/refinance.png")),
      //                   Text("BILL PAYMENY",style: TextStyle(fontFamily: 'kh',fontWeight: bold,color: white),textScaleFactor: 1,)
      //                 ],
      //               ),
      //             )),

      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 20,),
      //       Container(
      //         width: MediaQuery.of(context).size.width*0.9,
      //         height: MediaQuery.of(context).size.height*0.11,
      //         child: Expanded(child: Container(
      //           decoration: BoxDecoration(
      //             color: mainColor,
      //             borderRadius: BorderRadius.circular(10),
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey.shade300,
      //                 offset: Offset(4,4),
      //                 blurRadius: 15,
      //                 spreadRadius: 1
      //               )
      //             ]
      //           ),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               // Image(
      //               //   height: MediaQuery.of(context).size.height*0.08,
      //               //   image: AssetImage("assets/images/refinance.png")),
      //               Text("TOTAL",style: TextStyle(fontFamily: 'kh',fontWeight: bold,color: white),textScaleFactor: 1.2,)
      //             ],
      //           ),
      //         )),
      //       ),
      //     ],
      //   ),
      // ),
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1)
                ]),
                child: Column(
                  children: [
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          Expanded(child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("LOAN",style: TextStyle(fontFamily: 'kh',fontWeight: bold),textScaleFactor: 1.2,),
                                Text("0.00 USD",style: TextStyle(fontFamily: 'kh',color: Colors.green),textScaleFactor: 1.2, )
                              ],
                            ),
                          )),
                          Expanded(child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("TOP UP",style: TextStyle(fontFamily: 'kh',fontWeight: bold),textScaleFactor: 1.2,),
                                Text("0.00 USD",style: TextStyle(fontFamily: 'kh',color: Colors.green),textScaleFactor: 1.2,)
                              ],
                            ),
                          ))
                        ],
                      ),
                    )),
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          Expanded(child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("TRANSFER",style: TextStyle(fontFamily: 'kh',fontWeight: bold),textScaleFactor: 1.2,),
                                Text("0.00 USD",style: TextStyle(fontFamily: 'kh',color: Colors.green),textScaleFactor: 1.2,)
                              ],
                            ),
                          )),
                          Expanded(child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("BILL PAYMENT",style: TextStyle(fontFamily: 'kh',fontWeight: bold),textScaleFactor: 1.1,),
                                Text("0.00 USD",style: TextStyle(fontFamily: 'kh',color: Colors.green),textScaleFactor: 1.2,)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ))
                  ],
                ),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1)
                ]),
                child: Text('TOTAL',style: TextStyle(fontFamily: 'kh',fontWeight: bold,color: white),textScaleFactor: 1.2,), 
          ),
        ],
      )),
    );
  }
}
