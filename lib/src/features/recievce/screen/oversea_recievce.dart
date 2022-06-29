import 'dart:math';

import 'package:anakut_bank/src/features/recievce/screen/receive_receipt.dart';
import 'package:anakut_bank/src/features/transfer/bloc/bloc/transfer_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'recievce.dart';

class OverseaRecieve extends StatefulWidget {
  const OverseaRecieve({Key? key}) : super(key: key);

  @override
  State<OverseaRecieve> createState() => _OverseaRecieveState();
}

class _OverseaRecieveState extends State<OverseaRecieve> {
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  late TextEditingController? rec = TextEditingController();
  late TextEditingController? send = TextEditingController();
  late TextEditingController? code = TextEditingController();
  late TextEditingController? amount = TextEditingController();
  String Date = DateFormat.yMd().format(DateTime.now());
  String time = DateFormat.jm().format(DateTime.now());
  SingingCharacter? _character = SingingCharacter.USD;
  bool _isElevated = false;
  String curr = "USD";
  var CURRENCY_CODES = ["USD", "KHR", "THB"];
  String currency = "USD";
  var random = new Random();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TransferBloc>(context).add(StartedFetchTra());
    return BlocBuilder<TransferBloc, TransferState>(builder: (context, state) {
      if (state is FetchingTra) {
        return Center(
          child: Container(
              width: 100,
              child: LottieBuilder.asset(
                  "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
        );
      } else if (state is ErrorTra) {
        return Text(state.error.toString());
      }
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Text(
                        "Information",
                        style: TextStyle(fontFamily: 'kh'),
                        textScaleFactor: 1.1,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.85,
                    //   child: Text("Sender", style: TextStyle(),),
                    // ),
                    Container(
                      //padding: EdgeInsets.only(right: 14),
                      width: MediaQuery.of(context).size.width * 0.9,
                      //height: 44,
                      color: Colors.grey.shade100,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: code,
                              decoration: InputDecoration(
                                  hintText: "Code",
                                  // hintStyle: TextStyle(color: Colors.grey.shade400),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey.shade400)),
                                  enabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0)),
                            ),
                          ),
                          // InkWell(
                          //   child: Image(
                          //       width: 30,
                          //       height: 30,
                          //       image: AssetImage("assets/images/random.png")),
                          //   onTap: () {
                          //     setState(() {
                          //       code!.text = random.nextInt(1000000).toString();
                          //       print(random.nextInt(1000000).toString());
                          //     });
                          //   },
                          // ) 
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 14),
                      width: MediaQuery.of(context).size.width * 0.9,
                      //height: 44,
                      color: Colors.grey.shade100,
                      child: Row(
                        children: [
                          PopupMenuButton(
                            onSelected: (c) {
                              setState(() {
                                currency = c.toString();
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(currency),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                            itemBuilder: (context) => CURRENCY_CODES
                                .map((c) =>
                                    PopupMenuItem(value: c, child: Text(c)))
                                .toList(),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: amount,
                              decoration: InputDecoration(
                                  hintText: "Amount",
                                  // hintStyle: TextStyle(color: Colors.grey.shade400),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey.shade400)),
                                  enabledBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      //height: 44,
                      color: Colors.grey.shade100,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: send,
                        decoration: InputDecoration(
                            hintText: "Sender",

                            //hintStyle: TextStyle(color: Colors.grey.shade400),
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey.shade400)),
                            enabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      //height: 44,
                      color: Colors.grey.shade100,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: rec,
                        decoration: InputDecoration(
                            hintText: "Receiver",
                            // hintStyle: TextStyle(color: Colors.grey.shade400),
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey.shade400)),
                            enabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0)),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image(
                        image: AssetImage("assets/images/Bank/add.png"),
                      ),
                    )
                    // InkWell(
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: MediaQuery.of(context).size.width * 0.7,
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: mainColor,
                    //     ),
                    //     child: Text("Submit",
                    //         style: TextStyle(color: white, fontWeight: bold),
                    //         textScaleFactor: 1.1),
                    //   ),
                    //   onTap: (){
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => ReceiveReceipt(
                    //                 rec!.text.toString(),
                    //                 send!.text.toString(),
                    //                 amount!.text.toString(),
                    //                 time,
                    //                 Date,
                    //                 currency,
                    //                 code!.text.toString())));
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                  ),
                  child: Text("Submit",
                      style: TextStyle(color: white, fontWeight: bold),
                      textScaleFactor: 1.1),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceiveReceipt(
                              rec!.text.toString(),
                              send!.text.toString(),
                              amount!.text.toString(),
                              time,
                              Date,
                              currency,
                              code!.text.toString())));
                },
              ),
            ],
          ),
        ),
      );
      // return ListView.builder(
      //     itemCount: BlocProvider.of<TransferBloc>(context).namee.length,
      //     itemBuilder: (context, index) {
      //       return Text(BlocProvider.of<TransferBloc>(context)
      //           .namee[index]
      //           .home_name
      //           .toString());
      //     });
    });
  }
}
