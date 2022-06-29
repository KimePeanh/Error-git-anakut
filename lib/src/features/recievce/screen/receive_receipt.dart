import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ReceiveReceipt extends StatefulWidget {
  final String rec;
  final String Send;
  final String amount;
  final String time;
  final String date;
  final String curreny;
  final String code;

  ReceiveReceipt(
      this.rec, this.Send, this.amount, this.time, this.date, this.curreny, this.code);

  @override
  State<ReceiveReceipt> createState() => _ReceiveReceiptState();
}

class _ReceiveReceiptState extends State<ReceiveReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //SizedBox(height: 20,),
              SafeArea(
                  child: Text(
                "Anakut Bank",
                style: TextStyle(color: Colors.green, fontWeight: bold),
                textScaleFactor: 1.5,
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 50,
                child: Text("Receive Money",style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
                        textScaleFactor: 1.2,),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Text(
                        "Agent",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        ": Anakut Bank",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Text(
                        "Date",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        ": ${widget.date}  ${widget.time}",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Text(
                        "Sender",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        ": ${widget.Send}",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Text(
                        "Reciever",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        ": ${widget.rec}",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Text(
                        "Code",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        ": ${widget.code}",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Text(
                        "Amount",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        ": ${widget.amount}.00 ${widget.curreny}",
                        style: TextStyle(),
                        textScaleFactor: 1,
                      ),
                    ))
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
      ),
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
                      textScaleFactor: 1.2,
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
                      textScaleFactor: 1.2,
                    )),
                onTap: () async {
                  // screenshotController
                  //     .capture(delay: Duration(milliseconds: 10))
                  //     .then((capturedImage) async {
                  //   ShowCapturedWidget(context, capturedImage!);
                  // }).catchError((onError) {
                  //   print(onError);
                  // });
                  // print("object");
                  // await screenshotController
                  //     .capture(delay: const Duration(milliseconds: 10))
                  //     .then((_imageFile) async {
                  //   if (_imageFile != null) {
                  //     final directory =
                  //         (await getApplicationDocumentsDirectory())
                  //             .path; //from path_provide package
                  //     String fileName =
                  //         DateTime.now().microsecondsSinceEpoch.toString();
                  //     String path = '${directory}';
                  //     screenshotController.captureAndSave(directory,
                  //         fileName: fileName);
                  //   }
                  // });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
