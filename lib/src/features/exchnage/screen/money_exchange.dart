// import 'package:anakut_bank/src/features/exchnage/screen/receipt.dart';
// import 'package:anakut_bank/src/utils/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:forex_conversion/forex_conversion.dart';
// import 'package:intl/intl.dart';

// import 'exchangeform.dart';

// class ExchangeScreen extends StatefulWidget {
//   const ExchangeScreen({Key? key}) : super(key: key);

//   @override
//   State<ExchangeScreen> createState() => _ExchangeScreenState();
// }

// class _ExchangeScreenState extends State<ExchangeScreen> {
//   DateTime CurrentDate = DateTime.now();
//   String formattedDate = DateFormat.yMd().format(DateTime.now());
//   String timeformate = DateFormat.jm().format(DateTime.now());
//    TextEditingController _xFromController = TextEditingController();
//    TextEditingController _xToController = TextEditingController();
//     TextEditingController _sellrate = TextEditingController();
//  TextEditingController _buyrate = TextEditingController();
//    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String Date = DateFormat.yMd().format(DateTime.now());
//   String time = DateFormat.jm().format(DateTime.now());
//   List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
//   String _selectedLocation;
//   bool isLoading = true;
//   String Xfrom = "USD";
//   String Xto = "KHR";
//   double fromAmount;
//   double? toAmount;
//   double? inputusd;
//   double? usd;
//   String? getUsd;
//   double? x;
//   double? buy;
//   String? buyString;
//   String button = "Done";
//   double? get;
//   String exch = "Enter amount";
//   Color hintcolor = Colors.grey;
//   void rate() async {
//     final fx = Forex();
//     double myPriceInPKR = await fx.getCurrencyConverted("USD", "KHR", 1.0);
//     print("252.5 USD in PKR: ${myPriceInPKR}");
//     usd = myPriceInPKR;
//     getUsd = usd!.toStringAsFixed(2);
//     x = myPriceInPKR * 1 / 100;
//     buy = myPriceInPKR + x!;
//     buyString = buy!.toStringAsFixed(2);
//     if (getUsd != null) {
//       setState(() {
//         isLoading = false;
//       });
//     } else {
//       setState(() {
//         isLoading = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     rate();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mainColor,
//         elevation: 0,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.light,
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: white,
//             )),
//         title: Text("Money Exchange"),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(top: 20, bottom: 15),
//                 child: Text(
//                   formattedDate + " " + timeformate,
//                   style: TextStyle(fontFamily: 'kh'),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width - 30,
//                 height: MediaQuery.of(context).size.height * 0.08,
//                 //color: mainColor,
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                         child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Exchange Rate",
//                         style: TextStyle(),
//                         textScaleFactor: 1,
//                       ),
//                     )),
//                     Expanded(
//                         child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Buy",
//                         style: TextStyle(),
//                         textScaleFactor: 1,
//                       ),
//                     )),
//                     Expanded(
//                         child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Sell",
//                         style: TextStyle(),
//                         textScaleFactor: 1,
//                       ),
//                     )),
//                     Icon(Icons.edit, color: Colors.transparent)
//                   ],
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width - 30,
//                 height: MediaQuery.of(context).size.height * 0.05,
//                 //color: mainColor,

//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Color(0xffFEF2D5).withOpacity(0.5),
//                             border: Border.all(color: mainColor)),
//                         child: Row(
//                           children: <Widget>[
//                             Expanded(
//                                 child: Container(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "USD",
//                                 style: TextStyle(fontWeight: bold),
//                                 textScaleFactor: 1,
//                               ),
//                             )),
//                             Expanded(
//                                 child: Container(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 getUsd.toString(),
//                                 style: TextStyle(color: Colors.green),
//                                 textScaleFactor: 1,
//                               ),
//                             )),
//                             Expanded(
//                                 child: Container(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 buyString.toString(),
//                                 style: TextStyle(color: Colors.red),
//                                 textScaleFactor: 1,
//                               ),
//                             )),
//                           ],
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       child: Icon(Icons.edit, color: Colors.pink.shade600),
//                       onTap: () {
//                         showAlertDialog(context);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width - 30,
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                         child: TextFormField(
//                       decoration: InputDecoration(
//                         suffixIcon: InkWell(
//                           child: Icon(
//                             Icons.arrow_drop_down,
//                             size: 25,
//                           ),
//                           onTap: () {},
//                         ),

//                         // prefixIcon: Icon(Icons.arrow_drop_down),
//                         fillColor: Color(0xffFEF2D5).withOpacity(0.5),
//                         isDense: true,
//                         filled: true,
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         label: Text("From"),
//                         hintText: "USD",
//                         contentPadding:
//                             EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                         enabledBorder: OutlineInputBorder(
//                             gapPadding: 10,
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: mainColor)),

//                         focusedBorder: OutlineInputBorder(
//                             gapPadding: 10,
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: mainColor)),
//                       ),
//                       maxLines: 1,
//                       minLines: 1,
//                     )),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: TextFormField(
//                       decoration: InputDecoration(
//                         suffixIcon: Icon(
//                           Icons.arrow_drop_down,
//                           size: 30,
//                         ),
//                         fillColor: Color(0xffFEF2D5).withOpacity(0.5),
//                         filled: true,
//                         isDense: true,
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         label: Text("To"),
//                         hintText: "KHR",
//                         contentPadding:
//                             EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                         enabledBorder: OutlineInputBorder(
//                             gapPadding: 10,
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: mainColor)),
//                         focusedBorder: OutlineInputBorder(
//                             gapPadding: 10,
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: mainColor)),
//                       ),
//                       maxLines: 1,
//                       minLines: 1,
//                     )),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 height: 1.5,
//                 decoration: BoxDecoration(
//                     color: grey.withOpacity(0.2),
//                     boxShadow: [
//                       BoxShadow(
//                           color: grey.withOpacity(0.2),
//                           offset: Offset(0, 3),
//                           blurRadius: 10)
//                     ]),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, right: 15),
//                       child: TextFormField(
//                         controller: _xFromController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           fillColor: Color(0xffFEF2D5).withOpacity(0.5),
//                           filled: true,
//                           labelText: "Amount",
//                           labelStyle: TextStyle(fontFamily: 'kh'),
//                           floatingLabelBehavior: FloatingLabelBehavior.always,
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 10),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: mainColor),
//                             gapPadding: 10,
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: mainColor),
//                             gapPadding: 10,
//                           ),
//                         ),
//                         onChanged: (val) {
//                           if (val.length == 0) {
//                             setState(() {
//                               //inputusd = XfromController.text as double;
//                               get = 0 * usd!;
//                               exch = get!.toStringAsFixed(2);
//                               hintcolor = csblack;
//                               button = "Exchange";
//                               print(get);
//                             });
//                           } else {
//                             setState(() {
//                               //inputusd = XfromController.text as double;
//                               get = double.parse(val) * usd!;
//                               exch = get!.toStringAsFixed(2);
//                               hintcolor = csblack;
//                               button = "Exchange";
//                               _xToController?.text = exch.toString();
//                               print(get);
//                             });
//                           }
//                         },
//                         // validator: (value) {
//                         //   if (value!.isEmpty) {
//                         //     return AppLocalizations.of(context)!.translate("phReq");
//                         //   }
//                         //   return null;
//                         // },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, right: 15),
//                       child: TextFormField(
//                         controller: _xToController,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           fillColor: Color(0xffFEF2D5).withOpacity(0.5),
//                           filled: true,
//                           labelText: "Receive",
//                           labelStyle: TextStyle(fontFamily: 'kh'),
//                           floatingLabelBehavior: FloatingLabelBehavior.always,
//                           contentPadding: EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 10),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: mainColor),
//                             gapPadding: 10,
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             gapPadding: 10,
//                           ),
//                         ),
//                         // validator: (value) {
//                         //   if (value!.isEmpty) {
//                         //     return AppLocalizations.of(context)!.translate("phReq");
//                         //   }
//                         //   return null;
//                         // },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.only(left: 30, top: 30),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               InkWell(
//                 child: Container(
//                     alignment: Alignment.center,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xff7F0194),
//                     ),
//                     child: Text(
//                       "View Receipt",
//                       style: TextStyle(
//                           color: white, fontFamily: 'kh', fontWeight: bold),
//                       textScaleFactor: 1.2,
//                     )),
//                 onTap: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => Receipt(
//                   //             Date.toString(),
//                   //             time.toString(),
//                   //             _xFromController!.text.toString(),
//                   //             exch.toString(),
//                   //             getUsd.toString())));
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               InkWell(
//                 child: Container(
//                     alignment: Alignment.center,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: mainColor,
//                     ),
//                     child: Text(
//                       "Done",
//                       style: TextStyle(
//                           color: white, fontFamily: 'kh', fontWeight: bold),
//                       textScaleFactor: 1.2,
//                     )),
//                 onTap: () {},
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   showAlertDialog(BuildContext context) {
//     // set up the buttons
//     Widget cancelButton = TextButton(
//       child: Text("Cancel"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//     Widget continueButton = TextButton(
//       child: Text("Save"),
//       onPressed: () {},
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Edit Currency Rate"),
//       content: Container(
//         height: 220,
//         padding: EdgeInsets.only(bottom: 16),
//         //height: MediaQuery.of(context).size.height * 0.5,
//         child: Column(
//           children: [
//             Container(
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Container(
//                     child: Text("Currency"),
//                   )),
//                   Expanded(
//                       child: Container(
//                           child: TextFormField(
//                     decoration: InputDecoration(
//                       suffixIcon: InkWell(
//                         child: Icon(
//                           Icons.arrow_drop_down,
//                           size: 25,
//                         ),
//                         onTap: () {},
//                       ),

//                       // prefixIcon: Icon(Icons.arrow_drop_down),
//                       fillColor: Color(0xffFEF2D5).withOpacity(0.5),
//                       isDense: true,
//                       filled: true,
//                       // floatingLabelBehavior: FloatingLabelBehavior.always,
//                       // label: Text("From"),
//                       hintText: "USD",
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                       enabledBorder: OutlineInputBorder(
//                           gapPadding: 10,
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: mainColor)),

//                       focusedBorder: OutlineInputBorder(
//                           gapPadding: 10,
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: mainColor)),
//                     ),
//                     maxLines: 1,
//                     minLines: 1,
//                   ))),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _buyrate,
//               decoration: InputDecoration(
//                 fillColor: Color(0xffFEF2D5).withOpacity(0.5),
//                 isDense: true,
//                 filled: true,
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 label: Text("Buy"),
//                 hintText: "Rate",
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 enabledBorder: OutlineInputBorder(
//                     gapPadding: 10,
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: mainColor)),

//                 focusedBorder: OutlineInputBorder(
//                     gapPadding: 10,
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: mainColor)),
//               ),
//               maxLines: 1,
//               minLines: 1,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _sellrate,
//               decoration: InputDecoration(
//                 fillColor: Color(0xffFEF2D5).withOpacity(0.5),
//                 isDense: true,
//                 filled: true,
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 label: Text("Sell"),
//                 hintText: "Rate",
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 enabledBorder: OutlineInputBorder(
//                     gapPadding: 10,
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: mainColor)),

//                 focusedBorder: OutlineInputBorder(
//                     gapPadding: 10,
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: mainColor)),
//               ),
//               maxLines: 1,
//               minLines: 1,
//             )
//           ],
//         ),
//       ),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
