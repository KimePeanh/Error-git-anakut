import 'dart:math';

import 'package:anakut_bank/src/features/apply_loan/screen/apply_loan.dart';
import 'package:anakut_bank/src/features/recievce/screen/form.dart';
import 'package:anakut_bank/src/features/recievce/screen/num.dart';
import 'package:anakut_bank/src/features/recievce/screen/receive_receipt.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../app_localiztion.dart';
import 'local_recievce.dart';
import 'oversea_recievce.dart';
import 'recievce_transaction.dart';

enum SingingCharacter { USD, KHR, THAI }

class RecievceScreen extends StatefulWidget {
  const RecievceScreen({Key? key}) : super(key: key);

  @override
  State<RecievceScreen> createState() => _RecievceScreenState();
}

class _RecievceScreenState extends State<RecievceScreen> {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Receive",
              style: TextStyle(color: Colors.black),
              textScaleFactor: 1,
            ),
            bottom: TabBar(
              indicatorColor: mainColor,
              //indicatorSize: ,
              labelColor: mainColor,
              labelStyle: TextStyle(fontSize: 17),
              unselectedLabelStyle: TextStyle(fontSize: 17),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "Local",
                ),
                Tab(
                  text: "Oversea",
                )
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecievceTransaction()));
                    },
                    icon: Icon(
                      Icons.history,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          body: TabBarView(
            children: [LocalRecievce(), OverseaRecieve()],
          )
          ),
    );
  }
}
