import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class Pin extends StatefulWidget {
  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  bool isCh = false;
  String selImage = "";
  String selTi = "";
  List<String> Images = [
    "assets/images/Bank/mf.png",
    "assets/images/Bank/smart.png",
    "assets/images/Bank/cc.jpg",
    "assets/images/Bank/cc.jpg",
  ];
  List<String> name = [
    "Metfone",
    "Smart",
    "Cellcard",
    "Cellcard",
  ];

  List<String> amount = [
    "1\$",
    "1.5\$",
    "2\$",
    "2.5\$",
    "5\$",
    "10\$",
    "20\$",
    "50\$",
  ];


  Color color = mainColor;
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
                child: Text(
                  "Please Choose tthe operator",
                  style: TextStyle(),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: isCh == false
                      ? ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: ListTile(
                                  leading: Image(
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    image: AssetImage(Images[index]),
                                  ),
                                  title: Text(
                                    name[index],
                                    style: TextStyle(),
                                    textScaleFactor: 1,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isCh = true;
                                  selImage = Images[index];
                                  selTi = name[index];
                                  //color = col[index];
                                });
                              },
                            );
                          })
                      : ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: ListTile(
                                  leading: Image(
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    image: AssetImage(selImage),
                                  ),
                                  title: Text(
                                    selTi,
                                    style: TextStyle(),
                                    textScaleFactor: 1,
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isCh = false;
                                });
                              },
                            );
                          })),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                  child: isCh == true
                      ? Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                "Please Choose the amount to top up",
                                style: TextStyle(),
                                textScaleFactor: 1,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 11 / 9,
                                  ),
                                  itemCount: amount.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(8),
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: color),
                                      child: Text(
                                        amount[index].toString(),
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: bold,
                                            fontFamily: 'kh'),
                                        textScaleFactor: 1.1,
                                      ),
                                    );
                                  }),
                            )
                          ],
                        )
                      : null),
            ],
          ),
        ),
      ),
    );
  }
}
