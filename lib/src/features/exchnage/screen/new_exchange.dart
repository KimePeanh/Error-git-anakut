import 'package:anakut_bank/src/features/exchnage/bloc/create_bloc/bloc/create_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/screen/receipt.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/reciept/screen/reciept.dart';
import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forex_conversion/forex_conversion.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class Exchange extends StatefulWidget {
  //const Exchange({ Key? key }) : super(key: key);
  final String state;
  final String from;
  final String to;
  final String rate;
  final double? currency_in;
  final double? currency_out;

  Exchange(
      {required this.state,
      required this.from,
      required this.to,
      required this.rate,
      required this.currency_in,
      required this.currency_out});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  DateTime CurrentDate = DateTime.now();
  String formattedDate = DateFormat.yMd().format(DateTime.now());
  String timeformate = DateFormat.jm().format(DateTime.now());
  late TextEditingController? _xFromController = TextEditingController();
  late TextEditingController? _xToController = TextEditingController();
  late TextEditingController? _sellrate = TextEditingController();
  late TextEditingController? _buyrate = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  String Date = DateFormat.yMd().format(DateTime.now());
  String time = DateFormat.jm().format(DateTime.now());
  bool isLoading = true;
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
  MoneyFormatter? fmf;
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
    if (getUsd != null) {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    rate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double r;
    double o;
    o = double.parse(widget.rate);
    r = double.parse(widget.rate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Money Exchange",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocListener<CreateBloc, CreateState>(
        listener: (context, state) {
          if (state is Creating) {
            loadingDialogs(context);
          } else if (state is ErrorCreating) {
            print("hiiiiKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
            Navigator.of(context).pop();
            errorSnackBar(text: state.e, context: context);
          } else {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewReciept(
                        id: BlocProvider.of<CreateBloc>(context).id)));
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(4, 4),
                          blurRadius: 15,
                        )
                      ]),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.from}",
                          style: TextStyle(fontFamily: 'kh', fontWeight: bold),
                          textScaleFactor: 1.2,
                        ),
                      )),
                      Container(
                          width: 30,
                          height: 30,
                          child: Image(
                              image: AssetImage(
                                  "assets/images/Bank/exchange (4).png"))),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.to}",
                          style: TextStyle(fontFamily: 'kh', fontWeight: bold),
                          textScaleFactor: 1.2,
                        ),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          r.toStringAsFixed(2),
                          style: TextStyle(
                              fontFamily: 'kh',
                              fontWeight: bold,
                              color: Colors.green),
                          textScaleFactor: 1.2,
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                            ),
                            onTap: () {},
                          ),

                          // prefixIcon: Icon(Icons.arrow_drop_down),
                          fillColor: Color(0xffFEF2D5).withOpacity(0.5),
                          isDense: true,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text("From"),
                          hintText: "${widget.from}",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),

                          focusedBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                        ),
                        maxLines: 1,
                        minLines: 1,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                          fillColor: Color(0xffFEF2D5).withOpacity(0.5),
                          filled: true,
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text("To"),
                          hintText: "${widget.to}",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainColor)),
                        ),
                        maxLines: 1,
                        minLines: 1,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 1.5,
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.2),
                            offset: Offset(0, 3),
                            blurRadius: 10)
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
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
                            fillColor: Color(0xffFEF2D5).withOpacity(0.5),
                            filled: true,
                            labelText: "Amount",
                            labelStyle: TextStyle(fontFamily: 'kh'),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
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
                                get = 0 * r;
                                exch = get!.toStringAsFixed(2);
                                hintcolor = csblack;
                                button = "Exchange";
                                print(get);
                              });
                            } else {
                              setState(() {
                                //inputusd = XfromController.text as double;
                                if (widget.state == "in") {
                                  get = double.parse(val) * r;
                                  exch = get!.toStringAsFixed(4);
                                  hintcolor = csblack;
                                  button = "Exchange";
                                  _xToController?.text = exch.toString();
                                    fmf = MoneyFormatter(
                                      amount: double.parse(exch));
                                  _xToController?.text = fmf!.output.nonSymbol.toString();
                                  print(fmf!.output.nonSymbol);
                                  print(get);
                                } else {
                                  get = double.parse(val) / r;
                                  exch = get!.toStringAsFixed(4);
                                  hintcolor = csblack;
                                  button = "Exchange";

                                  fmf = MoneyFormatter(
                                      amount: double.parse(exch));
                                  _xToController?.text = fmf!.output.nonSymbol.toString();
                                  print(fmf!.output.nonSymbol);
                                }
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
                            fillColor: Color(0xffFEF2D5).withOpacity(0.5),
                            filled: true,
                            labelText: "Receive",
                            labelStyle: TextStyle(fontFamily: 'kh'),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
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
                if (widget.state == "in") {
                  BlocProvider.of<CreateBloc>(context).add(SubmitPress(
                      counter_id: 1,
                      currency_in: widget.currency_in!,
                      currency_out: widget.currency_out!,
                      rate: r,
                      amount_in: double.parse(_xFromController!.text),
                      amount_out: double.parse(exch)));
                } else {
                  BlocProvider.of<CreateBloc>(context).add(SubmitPress(
                      counter_id: 1,
                      currency_in: widget.currency_out!,
                      currency_out: widget.currency_in!,
                      rate: o,
                      amount_in: double.parse(_xFromController!.text),
                      amount_out: double.parse(exch)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
