import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:forex_conversion/forex_conversion.dart';

class ExchangeForm extends StatefulWidget {
  const ExchangeForm({Key? key}) : super(key: key);

  @override
  State<ExchangeForm> createState() => _ExchangeFormState();
}

class _ExchangeFormState extends State<ExchangeForm> {
  late TextEditingController? _xFromController = TextEditingController();
  late TextEditingController? _xToController = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  String Xfrom = "USD";
  String Xto = "KHR";
  double? fromAmount;
  double? toAmount;
  double? inputusd;
  double? usd;
  String? getUsd;
  double? x;
  double? buy;
  String? buyString;
  String button = "Done";
  double? get;
  String exch = "Enter amount";
  Color hintcolor = Colors.grey;
  void rate() async {
    final fx = Forex();
    double myPriceInPKR = await fx.getCurrencyConverted("USD", "KHR", 1.0);
    print("252.5 USD in PKR: ${myPriceInPKR}");
    usd = myPriceInPKR;
    getUsd = usd!.toStringAsFixed(2);
    x = myPriceInPKR * 1 / 100;
    buy = myPriceInPKR + x!;
    buyString = buy!.toStringAsFixed(2);
  }

  @override
  void initState() {
    rate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _xFromController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                fillColor: Color(0xffFEF2D5),
                filled: true,
                labelText: "Amount",
                labelStyle: TextStyle(fontFamily: 'kh'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: mainColor),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: mainColor),
                  gapPadding: 10,
                ),
              ),
              onChanged: (val) {
                if (val.length == 0) {
                  setState(() {
                    //inputusd = XfromController.text as double;
                    get = 0 * usd!;
                    exch = get!.toStringAsFixed(2);
                    hintcolor = csblack;
                    button = "Exchange";
                    print(get);
                  });
                } else {
                  setState(() {
                    //inputusd = XfromController.text as double;
                    get = double.parse(val) * usd!;
                    exch = get!.toStringAsFixed(2);
                    hintcolor = csblack;
                    button = "Exchange";
                     _xToController?.text = get.toString();
                    print(get);
                  });
                }
              },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return AppLocalizations.of(context)!.translate("phReq");
              //   }
              //   return null;
              // },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: _xToController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                fillColor: Color(0xffFEF2D5),
                filled: true,
                labelText: "Receive",
                labelStyle: TextStyle(fontFamily: 'kh'),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: mainColor),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 10,
                ),
              ),
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return AppLocalizations.of(context)!.translate("phReq");
              //   }
              //   return null;
              // },
            ),
          ),
        ],
      ),
    );
  }
}
