import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> loadingDialogs(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                backgroundColor: Colors.white,
                children: <Widget>[
                  Center(
                    child: Column(children: [
                      Container(
                          height: 80,
                          width: 70,
                          child: FittedBox(
                            child: new LottieBuilder.asset(
                                "assets/images/Bank/lf30_editor_bmeqpdqv.json"),
                          )),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        "Please Wait....",
                        style: TextStyle(color: Colors.black),
                      )
                    ]),
                  )
                ]));
      });
}
