import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String dropdownValue = 'All';
  var View = ["All", "Top Up", "Loan", "Money Exchange", "Bill Payment"];
  String view = "All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Transaction",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: PopupMenuButton(
                  onSelected: (c) {
                    setState(() {
                      view = c.toString();
                    });
                  },
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        view,
                        style: TextStyle(fontWeight: bold),
                        textScaleFactor: 1,
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  itemBuilder: (context) =>
                      View.map((c) => PopupMenuItem(value: c, child: Text(c)))
                          .toList(),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.1),
                              offset: Offset(0, 1),
                              blurRadius: 5,
                            )
                          ]),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Invoice No : ANK12346789",
                                style: TextStyle(fontFamily: 'kh'),
                                textScaleFactor: 0.9,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Date : 05-05-20022  2:37 PM",
                                style: TextStyle(fontFamily: 'kh'),
                                textScaleFactor: 0.9,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Type : Money Exchnage",
                                style: TextStyle(
                                    fontFamily: 'kh', color: Colors.blue),
                                textScaleFactor: 0.9,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Fee : 0.5 USD",
                                style: TextStyle(
                                    fontFamily: 'kh', color: Colors.green),
                                textScaleFactor: 0.9,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
