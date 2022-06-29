import 'package:anakut_bank/src/features/cash_out/screen/local_send.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cash_out_transaction.dart';
import 'oversea_send.dart';

enum SingingCharacter { USD, KHR, THAI }

class CashOutScreen extends StatefulWidget {
  const CashOutScreen({Key? key}) : super(key: key);

  @override
  State<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  // late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  // late TextEditingController? rec = TextEditingController();
  // late TextEditingController? send = TextEditingController();
  // late TextEditingController? code = TextEditingController();
  // late TextEditingController? amount = TextEditingController();
  // String Date = DateFormat.yMd().format(DateTime.now());
  // String time = DateFormat.jm().format(DateTime.now());
  // SingingCharacter? _character = SingingCharacter.USD;
  // var CURRENCY_CODES = ["USD", "KHR", "THB"];
  // String currency = "USD";
  // bool _isElevated = false;
  // String curr = "USD";
  // var random = new Random();
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
              "Send",
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
                              builder: (context) => CashOutTransaction()));
                    },
                    icon: Icon(
                      Icons.history,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              LocalSend(),
              OverSeaTransfer(),
            ],
          )),
    );
  }
}
