import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SetUpCurrency extends StatefulWidget {
  const SetUpCurrency({ Key? key }) : super(key: key);

  @override
  State<SetUpCurrency> createState() => _SetUpCurrencyState();
}

class _SetUpCurrencyState extends State<SetUpCurrency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor,
        elevation: 0,
        title: Text("Set Up Currency"),
      ),
      body: SingleChildScrollView(child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            
          ],
        ),
      ),),
    );
  }
}