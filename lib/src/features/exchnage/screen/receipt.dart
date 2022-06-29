import 'dart:typed_data';

import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class Receipt extends StatefulWidget {
  //const Receipt({ Key? key }) : super(key: key);
  final String from;
  final String to;
  final String date;
  final String time;
  final String amount;
  final String receive;
  final String rate;
  Receipt(this.from, this.to, this.date, this.time, this.amount, this.receive,
      this.rate);

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  Uint8List? _imageFile;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF5D9),
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Colors.white,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      //   toolbarHeight: 0,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
          child: Screenshot(
        controller: screenshotController,
        child: Center(
          child: Column(
            children: <Widget>[
              SafeArea(
                  child: Text(
                "Anakut MoneyExchange",
                style: TextStyle(
                    fontFamily: 'kh', fontWeight: bold, color: Colors.green),
                textScaleFactor: 2,
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Address"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          ": @87, st 164 (In-front of Backtouk School), Phnom Penh, Cambodia"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Phone Number"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": 010601168"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Agent"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": Anakut MoneyExchange"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Invoice Number"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": ANK112233"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Exchange Date"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": ${widget.date}  ${widget.time}"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xffFEF2D5),
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Purchase money"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": ${widget.amount}.00 ${widget.from}"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xffFEF2D5),
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Exchange rate"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(": ${widget.rate}"),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xffFEF2D5),
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Sales money"),
                    )),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(": ${widget.receive}.00 ${widget.to}",
                                style: TextStyle(color: Colors.red))))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 1,
                  color: Colors.black),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Expires on ${widget.date}"),
                    Text("Be sure to check before leaving"),
                    Text(
                        "We are not responsible for any departure from our store."),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    children: List.generate(
                        150 ~/ 3,
                        (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : Colors.grey,
                                height: 2,
                              ),
                            )),
                  )),
            ],
          ),
        ),
      )),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 30, top: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff7F0194),
                    ),
                    child: Text(
                      "Print Receipt",
                      style: TextStyle(
                          color: white, fontFamily: 'kh', fontWeight: bold),
                      textScaleFactor: 1.5,
                    )),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainColor,
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                          color: white, fontFamily: 'kh', fontWeight: bold),
                      textScaleFactor: 1.5,
                    )),
                onTap: () async {
                  // screenshotController
                  //     .capture(delay: Duration(milliseconds: 10))
                  //     .then((capturedImage) async {
                  //   ShowCapturedWidget(context, capturedImage!);
                  // }).catchError((onError) {
                  //   print(onError);
                  // });
                  print("object");
                  await screenshotController
                      .capture(delay: const Duration(milliseconds: 10))
                      .then((_imageFile) async {
                    if (_imageFile != null) {
                      final directory =
                          (await getApplicationDocumentsDirectory())
                              .path; //from path_provide package
                      String fileName =
                          DateTime.now().microsecondsSinceEpoch.toString();
                      String path = '${directory}';
                      screenshotController.captureAndSave(directory,
                          fileName: fileName);
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }
}
