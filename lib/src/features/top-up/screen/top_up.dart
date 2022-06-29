import 'package:anakut_bank/src/features/top-up/screen/pin.dart';
import 'package:anakut_bank/src/features/top-up/screen/unpin.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  bool isChoice = false;
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
            "Mobile Top Up",
            style: TextStyle(color: Colors.black),
            textScaleFactor: 1,
          ),
          bottom: TabBar(
            //indicatorSize: TabBarIndicatorSize.label,
            //isScrollable: true,

            indicatorColor: mainColor,
            labelColor: mainColor,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: "PIN",
              ),
              Tab(
                text: "PINLESS",
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Pin(),
          Unpin(),
        ]),
      ),
    );
  }
}
