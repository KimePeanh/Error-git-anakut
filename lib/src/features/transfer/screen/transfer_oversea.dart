import 'dart:math';

import 'package:anakut_bank/src/features/transfer/bloc/bloc/transfer_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../app_localiztion.dart';

class TransferOversea extends StatefulWidget {
  const TransferOversea({Key? key}) : super(key: key);

  @override
  State<TransferOversea> createState() => _TransferOverseaState();
}

class _TransferOverseaState extends State<TransferOversea> {
  TextEditingController code = TextEditingController();
  String dropdownValue = 'Thailand';
  String dropdownValue2 = "Western Union";
  List<String> n = [];
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TransferBloc>(context).add(StartedFetchTra());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        title: Text(
          "Transfer Oversea",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<TransferBloc, TransferState>(
        builder: (context, state) {
          if (state is FetchingTra) {
            return Center(
              child: Container(
                width: 100,
                child: LottieBuilder.asset(
                    "assets/images/Bank/lf30_editor_bmeqpdqv.json"),
              ),
            );
          } else if (state is ErrorTra) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          // n.add(BlocProvider.of<TransferBloc>(context)
          //     .transferModel!
          //     .home_name
          //     .toString());
          // print(n);
          return SingleChildScrollView(
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
                ],
              ),
            ),
          );
        },
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
                      color: mainColor,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: white, fontFamily: 'kh', fontWeight: bold),
                      textScaleFactor: 1.2,
                    )),
                onTap: () async {
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
                  // Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
