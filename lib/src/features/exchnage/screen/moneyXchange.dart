// import 'package:anakut_bank/app_localiztion.dart';
// import 'package:anakut_bank/src/shared/widgets/widget.dart';
// import 'package:anakut_bank/src/utils/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:forex_conversion/forex_conversion.dart';
// import 'package:dropbox_client/dropbox_client.dart';
// import 'package:intl/intl.dart';

// class MoneyExchnageScreen extends StatefulWidget {
//   const MoneyExchnageScreen({Key key}) : super(key: key);

//   @override
//   _MoneyExchnageScreenState createState() => _MoneyExchnageScreenState();
// }

// class _MoneyExchnageScreenState extends State<MoneyExchnageScreen> {
//   DateTime CurrentDate = DateTime.now();
//   String formattedDate = DateFormat.yMd().format(DateTime.now());
//   String timeformate = DateFormat.jm().format(DateTime.now());
//   TextEditingController XfromController = TextEditingController();
//   TextEditingController XtoController = TextEditingController();
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
//   bool isLoading = true;
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

//   void exchange() {
//     setState(() {
//       //inputusd = XfromController.text as double;
//       get = double.parse(XfromController.text) * usd!;
//       exch = get!.toStringAsFixed(2);
//       hintcolor = csblack;
//       button = "Exchange";
//       print(get);
//     });
//   }

//   @override
//   void initState() {
//     print("String");
//     print(formattedDate);
//     print(timeformate);
//     print("String");
//     rate();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(CurrentDate.day.toString() +
//         "/ " +
//         CurrentDate.month.toString() +
//         "/ " +
//         CurrentDate.year.toString() +
//         "  " +
//         CurrentDate.hour.toString() +
//         ":" +
//         CurrentDate.minute.toString());
//     return Scaffold(
//       appBar: AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.light,
//         ),
//         elevation: 0,
//         toolbarHeight: 65,
//         backgroundColor: mainColor,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: white,
//               size: 30,
//             )),
//         title: Text(
//           AppLocalizations.of(context)!.translate("moneyexchnage")!,
//           style: TextStyle(
//               fontSize: 25,
//               color: white,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'kh'),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: isLoading == true
//             ? CircularProgressIndicator()
//             : Column(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(top: 20, bottom: 30),
//                     child: Text(
//                       formattedDate + " " + timeformate,
//                       style: TextStyle(fontFamily: 'kh'),
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width - 50,
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                             child: Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             AppLocalizations.of(context)!
//                                 .translate("currency")!,
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.red.shade700,
//                                 fontFamily: 'kh'),
//                           ),
//                         )),
//                         Expanded(
//                             child: Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             AppLocalizations.of(context)!.translate("buy")!,
//                             style: TextStyle(
//                                 color: Colors.green, fontFamily: 'kh'),
//                           ),
//                         )),
//                         Expanded(
//                             child: Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             AppLocalizations.of(context)!.translate("sell")!,
//                             style: TextStyle(
//                                 color: Colors.green, fontFamily: 'kh'),
//                           ),
//                         )),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width - 50,
//                     height: 50,
//                     color: Colors.grey.shade300,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Expanded(
//                             child: Container(
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.monetization_on_sharp,
//                                 color: mainColor,
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 AppLocalizations.of(context)!.translate("usd")!,
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ],
//                           ),
//                         )),
//                         Expanded(
//                             child: Container(
//                           alignment: Alignment.center,
//                           child: Text(getUsd.toString()),
//                         )),
//                         Expanded(
//                             child: Container(
//                           alignment: Alignment.center,
//                           child: Text(buyString.toString()),
//                         )),
//                       ],
//                     ),
//                   ),
//                   Flexible(
//                       child: SizedBox(
//                     height: 50,
//                   )),
//                   Container(
//                     width: MediaQuery.of(context).size.width - 100,
//                     height: 48,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade400),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: <Widget>[
//                         Flexible(
//                             child: Container(
//                           child: TextFormField(
//                             controller: XfromController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: AppLocalizations.of(context)!
//                                   .translate("enterammount")!,
//                               border: InputBorder.none,
//                               hintStyle: TextStyle(fontFamily: 'kh'),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 15, vertical: 8),
//                             ),
//                             onChanged: (val) {
//                               if (val.length == 0){
//                                 setState(() {
//                                 //inputusd = XfromController.text as double;
//                                 get = 0 * usd!;
//                                 exch = get!.toStringAsFixed(2);
//                                 hintcolor = csblack;
//                                 button = "Exchange";
//                                 print(get);
//                               });
//                               }else{
//                                 setState(() {
//                                 //inputusd = XfromController.text as double;
//                                 get = double.parse(val) * usd!;
//                                 exch = get!.toStringAsFixed(2);
//                                 hintcolor = csblack;
//                                 button = "Exchange";
//                                 print(get);
//                               });
//                               }
//                             },
//                           ),
//                         )),
//                         Container(
//                           width: 70,
//                           height: 48,
//                           child: Row(
//                             children: [
//                               Text(
//                                 AppLocalizations.of(context)!.translate("usd")!,
//                                 style: TextStyle(
//                                     color: Colors.green, fontFamily: 'kh'),
//                               ),
//                               Icon(Icons.arrow_drop_down),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     //alignment: Alignment.centerRight,
//                     width: MediaQuery.of(context).size.width - 100,
//                     child: Container(
//                       child: Row(
//                         children: [
//                           Flexible(
//                               child: Container(
//                             width: MediaQuery.of(context).size.width - 170,
//                             height: 48,
//                           )),
//                           Container(
//                             alignment: Alignment.center,
//                             child: Icon(Icons.arrow_downward),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width - 100,
//                     height: 48,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade400),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: <Widget>[
//                         Flexible(
//                             child: Container(
//                           child: TextFormField(
//                             controller: XtoController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: exch,
//                               hintStyle:
//                                   TextStyle(color: hintcolor, fontFamily: 'kh'),
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 15, vertical: 10),
//                             ),
//                           ),
//                         )),
//                         Container(
//                           width: 70,
//                           height: 48,
//                           child: Row(
//                             children: [
//                               Text(
//                                 AppLocalizations.of(context)!.translate("khr")!,
//                                 style: TextStyle(
//                                     color: Colors.green, fontFamily: 'kh'),
//                               ),
//                               Icon(Icons.arrow_drop_down),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//       bottomNavigationBar: InkWell(
//         child: Container(
//           alignment: Alignment.center,
//           height: 50,
//           color: mainColor,
//           child: Text(
//             button,
//             style: TextStyle(
//                 color: white,
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'kh'),
//           ),
//         ),
//         onTap: () {
//           exchange();
//         },
//       ),
//     );
//   }
// }
