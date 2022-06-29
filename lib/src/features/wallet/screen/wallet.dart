import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/dallor/screen/USDScreen.dart';
import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
import 'package:anakut_bank/src/features/khr/screen/khrScreen.dart';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        toolbarHeight: 65,
        backgroundColor: mainColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: white,
              size: 30,
            )),
        title: Text(
          AppLocalizations.of(context)!.translate("wallet")!,
          style: TextStyle(
              fontSize: 25, color: white, fontWeight: FontWeight.bold,fontFamily: 'kh'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            InkWell(child: wallet(context, "0887112932", "1,100 USD","assets/images/usd.jpg"),
              onTap: (){
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => USDSCreen()));
              }
            ),
            // SizedBox(
            //   height: 10,
            // ),
            InkWell(
              child: wallet(context, "0887112932", "1,000,000 KHR","assets/images/riel.jpg"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KhrScreen()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
