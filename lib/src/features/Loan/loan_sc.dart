// import 'package:anakut_bank/src/features/Loan/loan_payment.dart';
// import 'package:anakut_bank/src/utils/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:screenshot/screenshot.dart';

// class LoanSc extends StatefulWidget {
//   // const LoanSc({Key? key}) : super(key: key);
//   final String amount;
//   final String date;
//   final String name;

//   LoanSc(this.amount, this.date, this.name);

//   @override
//   State<LoanSc> createState() => _LoanScState();
// }

// class _LoanScState extends State<LoanSc> {
//   ScreenshotController screenshotController = ScreenshotController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Screenshot(
//           controller: screenshotController,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                   SafeArea(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.account_balance,
//                         size: 40,
//                         color: Colors.green,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "Anakut Bank",
//                         style: TextStyle(
//                             color: Colors.green,
//                             fontFamily: 'kh',
//                             fontWeight: bold),
//                         textScaleFactor: 1.5,
//                       )
//                     ],
//                   )),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: Column(
//                           children: [
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Loan Amount"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": ${widget.amount}"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Interest rate"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": 3.00%"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Loan period"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": 12 Months"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Start Date"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": ${widget.date}"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )),
//                         Expanded(
//                             child: Column(
//                           children: [
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Phone Number"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": 0887112932"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Debtor"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": ${widget.name}"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Loan period"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": 12 Months"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: Container(
//                                     child: Text("Start Date"),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                     child: Text(": ${widget.date}"),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Table(

//                   //     border: TableBorder
//                   //         .all(), // Allows to add a border decoration around your table
//                   //     children: [
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '???.???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '?????????????????????????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???????????????????????????????????????????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???????????????????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(""),
//                   //         Text(
//                   //           "?????????????????????????????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.green.withOpacity(0.3),
//                   //         ),
//                   //         children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.green.withOpacity(0.3),
//                   //         ),
//                   //         children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.green.withOpacity(0.3),
//                   //         ),
//                   //         children: [

//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(

//                   //         children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '???',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '??????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '??????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '??????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????-??????-????????????',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '??????.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '???.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "?????????",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //     ]),

//                   DataTable(
//                       columnSpacing: 10,
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                       ),
//                       columns: const <DataColumn>[
//                         DataColumn(
//                           label: Text(
//                             '???.???',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             '?????????????????????????????????',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             '???????????????????????????????????????????????????',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             '???????????????????????????',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             '?????????????????????????????????',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                       ],
//                       rows: [
                        
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               color: Colors.green.withOpacity(0.3),
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               color: Colors.green.withOpacity(0.3),
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               color: Colors.green.withOpacity(0.3),
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(

//                             // onSelectChanged: (value) {
//                             //   Navigator.push(
//                             //       context,
//                             //       MaterialPageRoute(
//                             //           builder: (context) => LoanPayment()));
//                             // },
//                             cells: [
//                               DataCell(
//                                 Container(
//                                   width: 10,
//                                   child: Text(
//                                     '???',
//                                     style: TextStyle(fontFamily: 'kh'),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Container(
//                                   //width: 10,
//                                   child: Text(
//                                     '??????-??????-????????????',
//                                     style: TextStyle(fontFamily: 'kh'),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Container(
//                                   child: Text(
//                                     '??????.00',
//                                     style: TextStyle(fontFamily: 'kh'),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Text(
//                                   '???.00',
//                                   style: TextStyle(fontFamily: 'kh'),
//                                 ),
//                               ),
//                               DataCell(
//                                 Text(
//                                   '?????????',
//                                   style: TextStyle(fontFamily: 'kh'),
//                                 ),
//                               )
//                             ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '???',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '??????',
//                                 style:
//                                     TextStyle(fontFamily: 'kh', fontSize: 10),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '??????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '??????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '??????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '??????-??????-????????????',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '??????.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '???.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '?????????',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ])
//                       ])
//                 ],
//               ),
//             ),
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
//                       "Print Receipt",
//                       style: TextStyle(
//                           color: white, fontFamily: 'kh', fontWeight: bold),
//                       textScaleFactor: 1.2,
//                     )),
//                 onTap: () {},
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
//                       "Save and Exit",
//                       style: TextStyle(
//                           color: white, fontFamily: 'kh', fontWeight: bold),
//                       textScaleFactor: 1.2,
//                     )),
//                 onTap: () async {
//                   print("object");
//                   await screenshotController
//                       .capture(delay: const Duration(milliseconds: 10))
//                       .then((_imageFile) async {
//                     if (_imageFile != null) {
//                       final directory =
//                           (await getApplicationDocumentsDirectory())
//                               .path; //from path_provide package
//                       String fileName =
//                           DateTime.now().microsecondsSinceEpoch.toString();
//                       String path = '${directory}';
//                       screenshotController.captureAndSave(directory,
//                           fileName: fileName);
//                     }
//                   });
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
