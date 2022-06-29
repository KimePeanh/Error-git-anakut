import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExchangeRate extends StatefulWidget {
  //const ExchangeRate({Key? key}) : super(key: key);
  final String from;
  final String to;
  final String inn;
  final String outt;

  ExchangeRate(this.from, this.to, this.inn, this.outt);

  @override
  State<ExchangeRate> createState() => _ExchangeRateState();
}

class _ExchangeRateState extends State<ExchangeRate> {
  TextEditingController buy = TextEditingController();
  TextEditingController sell = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String from = "${widget.from.toString()}";
    String to = "${widget.to.toString()}";
    buy.text = widget.outt;
    sell.text = widget.inn;
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
          "Exchange Rate",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      child: Text(
                        "From",
                        style: TextStyle(fontFamily: 'kh'),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        "To",
                        style: TextStyle(fontFamily: 'kh'),
                        textScaleFactor: 1,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(4, 4),
                                blurRadius: 15)
                          ]),
                      child: DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        value: from,
                        elevation: 18,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        onChanged: (String? newValue) {
                          setState(() {
                            from = newValue!;
                          });
                        },
                        items: <String>[
                          'Riel',
                          'Dollar',
                          'Thai',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(4, 4),
                                blurRadius: 15)
                          ]),
                      child: DropdownButton<String>(
                        value: to,
                        elevation: 18,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        underline: SizedBox.shrink(),
                        onChanged: (String? newValue) {
                          setState(() {
                            to = newValue!;
                          });
                        },
                        items: <String>[
                          'Riel',
                          'Dollar',
                          'Thai',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      child: Text(
                        "Buy",
                        style: TextStyle(fontFamily: 'kh'),
                        textScaleFactor: 1,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Text(
                        "Sell",
                        style: TextStyle(fontFamily: 'kh'),
                        textScaleFactor: 1,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        controller: buy,
                        decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      child: TextFormField(
                        controller: sell,
                        decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grey),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )),
                  ],
                ),
              ),
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
                child: Text("Save",
                    style: TextStyle(color: white, fontWeight: bold),
                    textScaleFactor: 1.1),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
