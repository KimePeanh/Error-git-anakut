import 'dart:math';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OverSeaTransfer extends StatefulWidget {
  const OverSeaTransfer({Key? key}) : super(key: key);

  @override
  State<OverSeaTransfer> createState() => _OverSeaTransferState();
}

class _OverSeaTransferState extends State<OverSeaTransfer> {
  TextEditingController code = TextEditingController();
  String dropdownValue = 'Thailand';
  String dropdownValue2 = "Western Union";
  List<String> n = [];
  var random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                //height: 44,
                color: Colors.grey.shade100,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // controller: send,
                  decoration: InputDecoration(
                      hintText: "Sender",

                      //hintStyle: TextStyle(color: Colors.grey.shade400),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: Colors.grey.shade400)),
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
                  // controller: rec,
                  decoration: InputDecoration(
                      hintText: "Receiver",
                      // hintStyle: TextStyle(color: Colors.grey.shade400),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(right: 14),
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
                    InkWell(
                      child: Image(
                          width: 30,
                          height: 30,
                          image: AssetImage("assets/images/random.png")),
                      onTap: () {
                        setState(() {
                          code.text = random.nextInt(1000000).toString();
                          print(random.nextInt(1000000).toString());
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                  "To Country",
                  style: TextStyle(
                    fontFamily: 'kh',
                  ),
                  textScaleFactor: 0.9,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 18,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 1.5,
                    color: mainColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Thailand', 'China', 'Vietnam', 'Lao']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                  "Partner",
                  style: TextStyle(
                    fontFamily: 'kh',
                  ),
                  textScaleFactor: 0.9,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: DropdownButton<String>(
                  value: dropdownValue2,
                  elevation: 18,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 1.5,
                    color: mainColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  },
                  items: <String>[
                    'Western Union',
                    'DeeMoney',
                    'Tranglo',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.2,
                child: Image(image: AssetImage("assets/images/Bank/add.png"),),
              )
            ],
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
                child: Text("Send",
                    style: TextStyle(color: white, fontWeight: bold),
                    textScaleFactor: 1.1),
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Receipt(
                //             rec!.text.toString(),
                //             send!.text.toString(),
                //             amount!.text.toString(),
                //             time,
                //             Date,
                //             currency,
                //             code!.text.toString())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
