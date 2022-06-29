import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/payment/bloc/create_history/bloc/create_history_bloc.dart';
import 'package:anakut_bank/src/features/payment/screen/payment_recipt.dart';
import 'package:anakut_bank/src/features/setting/blog/setting/bloc/currency_bloc/bloc/currency_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

CurrencyBloc currencyBloc = CurrencyBloc();
CreateHistoryBloc createHistoryBloc = CreateHistoryBloc();

class BillPaymentScreen extends StatefulWidget {
  //const BillPaymentScreen({ Key? key }) : super(key: key);
  final String image;
  final String name;
  final String catename;
  BillPaymentScreen(
      {required this.image, required this.name, required this.catename});

  @override
  State<BillPaymentScreen> createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  late TextEditingController? amount = TextEditingController();
  late TextEditingController? counterCon = TextEditingController();
  late TextEditingController? notecon = TextEditingController();
  String currency = "USD";
  String curr = "USD";
  String symbol = "";
  int? id;
  var CURRENCY_CODES = [];
  @override
  void initState() {
    currencyBloc.add(FetchCurrencyStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          widget.catename,
          style: TextStyle(color: Colors.white, fontFamily: 'kh'),
        ),
      ),
      body: BlocBuilder(
        bloc: currencyBloc,
        builder: (context, state) {
          if (state is FetchingCurrency) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorFetchingCurrency) {
            return Container();
          }
          CURRENCY_CODES.clear();
          currencyBloc.getCurrency.forEach((data) {
            CURRENCY_CODES.add(data.name);
          });
          return BlocListener(
            bloc: createHistoryBloc,
            listener: (context, state) {
              if (state is CreatingHistory) {
                loadingDialogs(context);
              } else if (state is ErrorCreateHistory) {
                Navigator.pop(context);
              } else if (state is CreatedHistory) {
                Navigator.pop(context);
                Fluttertoast.showToast(msg: "Success");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentReceipt()));
              }
            },
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: mainColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.image == "no_image.png"
                            ? Image(
                                width: 100,
                                height: 100,
                                image: AssetImage("assets/images/no-photo.png"))
                            : Image(
                                width: 100,
                                height: 100,
                                image: NetworkImage(widget.image),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(color: white),
                          textScaleFactor: 1,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
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
                                      for (int i = 0;
                                          i < currencyBloc.getCurrency.length;
                                          i++) {
                                        if (c ==
                                            currencyBloc.getCurrency[i].name) {
                                          id = currencyBloc.getCurrency[i].id;
                                          symbol = currencyBloc
                                              .getCurrency[i].symbol!;
                                        }
                                      }
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(currency),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                  itemBuilder: (context) => CURRENCY_CODES
                                      .map((c) => PopupMenuItem(
                                          value: c, child: Text(c.toString())))
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
                            // child: TextFormField(
                            //   readOnly: true,
                            //   keyboardType: TextInputType.number,
                            //   controller: counterCon,
                            //   decoration: InputDecoration(
                            //       // suffix: Padding(
                            //       //   padding: const EdgeInsets.only(left: 8, right: 8),
                            //       //   child: PopupMenuButton(
                            //       //     onSelected: (c) {
                            //       //       setState(() {

                            //       //       });
                            //       //     },
                            //       //     child: Row(
                            //       //       children: <Widget>[
                            //       //         Expanded(child: Text("Counter 1")),
                            //       //         Icon(Icons.arrow_drop_down)
                            //       //       ],
                            //       //     ),
                            //       //     itemBuilder: (context) => CURRENCY_CODES
                            //       //         .map((c) => PopupMenuItem(
                            //       //             value: c,
                            //       //             child: Text(c.toString())))
                            //       //         .toList(),
                            //       //   ),
                            //       // ),
                            //       hintText: "Counter 1",
                            //       // hintStyle: TextStyle(color: Colors.grey.shade400),
                            //       focusedBorder: OutlineInputBorder(
                            //           borderSide: new BorderSide(
                            //               color: Colors.grey.shade400)),
                            //       enabledBorder: InputBorder.none,
                            //       contentPadding: const EdgeInsets.only(
                            //           left: 14.0, bottom: 8.0, top: 8.0)),
                            //   onTap: () {
                            //     PopupMenuButton(
                            //       onSelected: (c) {
                            //         setState(() {});
                            //       },
                            //       child: Row(
                            //         children: <Widget>[
                            //           Expanded(child: Text("Counter 1")),
                            //           Icon(Icons.arrow_drop_down)
                            //         ],
                            //       ),
                            //       itemBuilder: (context) => CURRENCY_CODES
                            //           .map((c) => PopupMenuItem(
                            //               value: c, child: Text(c.toString())))
                            //           .toList(),
                            //     );
                            //   },
                            // ),
                            child: PopupMenuButton(
                              onSelected: (c) {
                                setState(() {});
                              },
                              child: TextFormField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: counterCon,
                                decoration: InputDecoration(
                                    hintText: "Counter 1",
                                    // hintStyle: TextStyle(color: Colors.grey.shade400),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.grey.shade400)),
                                    enabledBorder: InputBorder.none,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0)),
                              ),
                              itemBuilder: (context) => CURRENCY_CODES
                                  .map((c) => PopupMenuItem(
                                      value: c, child: Text(c.toString())))
                                  .toList(),
                            ),
                            //   },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height: 44,
                            color: Colors.grey.shade100,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: notecon,
                              decoration: InputDecoration(
                                  hintText: "Note",
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
                  ))
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: InkWell(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: mainColor,
          child: Text(
            "Pay Now",
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
            textScaleFactor: 1.2,
          ),
        ),
        onTap: () {
          createHistoryBloc.add(CreatePress(
              counter_id: "1",
              currency_id: id!,
              amount: amount!.text.toString(),
              note: notecon!.text.toString()));
        },
      ),
    );
  }
}
