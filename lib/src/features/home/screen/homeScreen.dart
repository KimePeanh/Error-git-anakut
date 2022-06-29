import 'dart:async';
import 'dart:ui';
import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'menu.dart';
import 'appbar.dart';
import 'mainContent.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  final String PIN;
  HomeScreen(this.PIN);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String versionn = "ver";
  var choice;
  void buildversion() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      setState(() {
        versionn = version;
      });
      print(versionn);
      print(version);
    });
  }

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  String storedPasscode = '1234';
  bool isAuthenticated = false;

  GlobalKey<ScaffoldState> _key = GlobalKey();
  var dotpisition = 0;
  @override
  void initState() {
    buildversion();
    print(widget.PIN);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: mainColor,
      backgroundColor: mainColor,
      key: _key,
      drawer: sidemenu(context),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 150,
        backgroundColor: mainColor,
        //backgroundColor: white,
        title: Column(
          children: [HomepageAppBar(), Menu()],
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Column(
              children: <Widget>[
                //SafeArea(child: appbar(context)),
                SizedBox(
                  height: 5,
                ),
                //Text("Hii"),
                Contents(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
