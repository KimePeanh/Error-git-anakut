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
//                   //           'ល.រ',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           'កាលបរិច្ចេទ',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           'ប្រាក់បង់ប្រចាំខែ',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           'ការប្រាក់',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(""),
//                   //         Text(
//                   //           "ប្រាក់នៅសល់",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.green.withOpacity(0.3),
//                   //         ),
//                   //         children: [
//                   //         Text(
//                   //           '១',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.green.withOpacity(0.3),
//                   //         ),
//                   //         children: [
//                   //         Text(
//                   //           '២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(
//                   //         decoration: BoxDecoration(
//                   //           color: Colors.green.withOpacity(0.3),
//                   //         ),
//                   //         children: [

//                   //         Text(
//                   //           '៣',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(

//                   //         children: [
//                   //         Text(
//                   //           '៤',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '៥',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '៦',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '៧',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '៨',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '៩',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '១០',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '១១',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //       ]),
//                   //       TableRow(children: [
//                   //         Text(
//                   //           '១២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '០៥-០៥-២០២២',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៣៤.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text(
//                   //           '៩.00',
//                   //           style: TextStyle(fontFamily: 'kh'),
//                   //         ),
//                   //         Text("data"),
//                   //         Text(
//                   //           "៣៧៤",
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
//                             'ល.រ',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'កាលបរិច្ចេទ',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'ប្រាក់បង់ប្រចាំខែ',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'ការប្រាក់',
//                             style: TextStyle(fontFamily: 'kh'),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'ប្រាក់នៅសល់',
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
//                                 '១',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០៥-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
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
//                                 '២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០៦-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
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
//                                 '៣',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០៧-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
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
//                                     '៤',
//                                     style: TextStyle(fontFamily: 'kh'),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Container(
//                                   //width: 10,
//                                   child: Text(
//                                     '០៥-០៨-២០២២',
//                                     style: TextStyle(fontFamily: 'kh'),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Container(
//                                   child: Text(
//                                     '៣៤.00',
//                                     style: TextStyle(fontFamily: 'kh'),
//                                   ),
//                                 ),
//                               ),
//                               DataCell(
//                                 Text(
//                                   '៩.00',
//                                   style: TextStyle(fontFamily: 'kh'),
//                                 ),
//                               ),
//                               DataCell(
//                                 Text(
//                                   '៣៧៤',
//                                   style: TextStyle(fontFamily: 'kh'),
//                                 ),
//                               )
//                             ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '៥',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០៩-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '៦',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-១០-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '៧',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-១១-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '៨',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-១២-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '៩',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០១-២០២៣',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '១០',
//                                 style:
//                                     TextStyle(fontFamily: 'kh', fontSize: 10),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០២-២០២៣',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '១១',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០៣-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '១២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០៤-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           )
//                         ]),
//                         DataRow(cells: [
//                           DataCell(
//                             Container(
//                               width: 10,
//                               child: Text(
//                                 '១២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               //width: 10,
//                               child: Text(
//                                 '០៥-០៤-២០២២',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Container(
//                               child: Text(
//                                 '៣៤.00',
//                                 style: TextStyle(fontFamily: 'kh'),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៩.00',
//                               style: TextStyle(fontFamily: 'kh'),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               '៣៧៤',
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
