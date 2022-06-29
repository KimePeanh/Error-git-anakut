import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/Auth/bloc/bloc/auth_bloc.dart';
import 'package:anakut_bank/src/features/account/bloc/bloc/account_bloc.dart';
import 'package:anakut_bank/src/features/account/screen/accountScreen.dart';
import 'package:anakut_bank/src/features/account/screen/namecard.dart';
import 'package:anakut_bank/src/features/help_center/screen/help_center.dart';
import 'package:anakut_bank/src/features/invite/screen/inviteFreind.dart';
import 'package:anakut_bank/src/features/language/screen/languages.dart';
import 'package:anakut_bank/src/features/login/screen/googleSign.dart';
import 'package:anakut_bank/src/features/menu/screen/mypf.dart';
import 'package:anakut_bank/src/features/menu/screen/shrimmer.dart';
import 'package:anakut_bank/src/features/menu/screen/widget.dart';
import 'package:anakut_bank/src/features/point/screen/PointScreen.dart';
import 'package:anakut_bank/src/features/splash/screen/splash.dart';
import 'package:anakut_bank/src/features/transaction/screen/transaction.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../mybank/screen/MyBank.dart';
import '../../upgrade/screen/upgradeScreen.dart';
import 'contact.dart';

class MenuSideScreen extends StatefulWidget {
  const MenuSideScreen({Key? key}) : super(key: key);

  @override
  _MenuSideScreenState createState() => _MenuSideScreenState();
}

class _MenuSideScreenState extends State<MenuSideScreen> {
  Future singout() async {
    await GoogleSignInApi.logout();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
        if (state is FetchingAccount) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
              ),
              elevation: 0,
              toolbarHeight: MediaQuery.of(context).size.height * 0.18,
              backgroundColor: mainColor,
              automaticallyImplyLeading: false,
              title: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: 5),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.logout,
                                  color: white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  singout();
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(LogoutPressed());
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SplashScreen()));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Container(
                            //   //color: white,
                            //   height: 60,
                            //   alignment: Alignment.topLeft,
                            //   child: Container(
                            //     alignment: Alignment.centerLeft,
                            //     width: 60,
                            //     height: 60,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //     ),
                            //     child: MyProfile(
                            //       accountModel:
                            //           BlocProvider.of<AccountBloc>(context)
                            //               .accountModel!,
                            //     ),
                            //   ),
                            // ),
                            Expanded(
                              child: Loadinggg(),
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: white,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountScreen(
                                    accountModel:
                                        BlocProvider.of<AccountBloc>(context)
                                            .accountModel!)));
                      },
                    )),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 55,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(2, 2),
                                      blurRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: white,
                                border:
                                    Border.all(color: Colors.grey.shade100)),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 35,
                                  height: 35,
                                  child: Image(
                                    image: AssetImage("assets/images/vip.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    "Upgrade Account",
                                    style: TextStyle(
                                        fontSize: 17, fontFamily: 'kh'),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 55,
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 60,
                              //padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.green)),
                              child: Text(
                                "Verified",
                                style: TextStyle(
                                    color: Colors.green, fontFamily: 'kh'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpgradeScreen()));
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // InkWell(
                    //   child: Container(
                    //     padding: EdgeInsets.all(10),
                    //     width: MediaQuery.of(context).size.width - 40,
                    //     height: 55,
                    //     decoration: BoxDecoration(
                    //         boxShadow: [
                    //           BoxShadow(
                    //               color: Colors.grey.shade200,
                    //               offset: Offset(2, 2),
                    //               blurRadius: 1)
                    //         ],
                    //         color: white,
                    //         border: Border.all(color: Colors.grey.shade100),
                    //         borderRadius: BorderRadius.circular(5)),
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             child: Container(
                    //           child: Text(
                    //               AppLocalizations.of(context)!
                    //                   .translate('namecard')!,
                    //               style:
                    //                   TextStyle(fontSize: 17, fontFamily: 'kh')),
                    //         )),
                    //         Container(
                    //           width: 40,
                    //           height: 40,
                    //           child: Icon(
                    //             Icons.qr_code,
                    //             color: Colors.blue,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => NameCardScreen(
                    //                 BlocProvider.of<AccountBloc>(context)
                    //                     .accountModel!)));
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 40,
                        height: 55,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 2),
                                  blurRadius: 1)
                            ],
                            color: white,
                            border: Border.all(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('mybank')!,
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'kh')),
                            )),
                            Container(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.account_balance_outlined,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MybankScreen()));
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 40,
                        height: 55,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 2),
                                  blurRadius: 1)
                            ],
                            color: white,
                            border: Border.all(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('mypoint')!,
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'kh')),
                            )),
                            Container(
                                width: 40,
                                height: 40,
                                child: Image(
                                  image:
                                      AssetImage('assets/images/logobank.png'),
                                ))
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PointScreen()));
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height * 0.35,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          // boxShadow: [
                          //     BoxShadow(
                          //       color: grey.withOpacity(0.3),
                          //       blurRadius: 10,
                          //       offset: Offset(2,4),
                          //     ),
                          //   ],
                          color: white,
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            child: Row(
                              children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Bank/user-interface.png"))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    "Phone Top-Up",
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade300,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            height: 1,
                            color: Colors.grey.shade100,
                          ),
                          Expanded(
                              child: Container(
                            child: Row(
                              children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/cars.png"))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('bankcard')!,
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade300,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            height: 1,
                            color: Colors.grey.shade100,
                          ),
                          Expanded(
                              child: InkWell(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                      width: 30,
                                      height: 30,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/transac.png"))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('trasaction')!,
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 17),
                                    ),
                                  )),
                                  Container(
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade300,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionScreen()));
                            },
                          )),
                          Container(
                            height: 1,
                            color: Colors.grey.shade100,
                          ),
                          Expanded(
                              child: InkWell(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/Bank/add-user.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('invitefir')!,
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 17),
                                    ),
                                  )),
                                  Container(
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade300,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InviteScreen()));
                            },
                          )),
                          Container(
                            height: 1,
                            color: Colors.grey.shade100,
                          ),
                          Expanded(
                              child: InkWell(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/Bank/globe.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('lang')!,
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 17),
                                    ),
                                  )),
                                  Container(
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade300,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              languageModal(context);
                            },
                          )),
                          Container(
                            height: 1,
                            color: Colors.grey.shade100,
                          ),
                          Expanded(
                              child: InkWell(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    child: Icon(
                                      Icons.contact_support_rounded,
                                      size: 35,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('helpcenter')!,
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 17),
                                    ),
                                  )),
                                  Container(
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade300,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelpCenter()));
                            },
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 130,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade100)),
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            child: Row(
                              children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/info.png"))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('about')!,
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            height: 1,
                            color: Colors.grey.shade100,
                          ),
                          Expanded(
                              child: InkWell(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate('contact us')!,
                                      style: TextStyle(
                                          fontFamily: 'kh', fontSize: 17),
                                    ),
                                  )),
                                  Container(
                                    width: 35,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade300,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Contact(context);
                            },
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is ErrorFetchAccount) {
          print("error");
          return Center(
            child: Text(state.error.toString()),
          );
        }
        print(BlocProvider.of<AccountBloc>(context)
            .accountModel!
            .verified_status);
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.18,
            backgroundColor: mainColor,
            automaticallyImplyLeading: false,
            title: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 5),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: white,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.logout,
                                color: white,
                                size: 30,
                              ),
                              onPressed: () {
                                singout();
                                BlocProvider.of<AuthBloc>(context)
                                    .add(LogoutPressed());
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //color: white,
                            height: 60,
                            alignment: Alignment.topLeft,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: MyProfile(
                                accountModel:
                                    BlocProvider.of<AccountBloc>(context)
                                        .accountModel!,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            //color: white,
                            padding: EdgeInsets.only(left: 10),
                            height: 70,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlocProvider.of<AccountBloc>(context)
                                            .accountModel!
                                            .firstname ==
                                        null
                                    ? Text("")
                                    : Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${BlocProvider.of<AccountBloc>(context).accountModel!.lastname!}" +
                                              " ${BlocProvider.of<AccountBloc>(context).accountModel!.firstname!}",
                                          style: TextStyle(
                                              fontWeight: bold, color: white),
                                          textScaleFactor: 0.85,
                                        ),
                                      ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    BlocProvider.of<AccountBloc>(context)
                                        .accountModel!
                                        .email
                                        .toString(),
                                    style: TextStyle(color: white),
                                    textScaleFactor: 0.78,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(
                            width: 70,
                            height: 70,
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountScreen(
                                  accountModel:
                                      BlocProvider.of<AccountBloc>(context)
                                          .accountModel!)));
                    },
                  )),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 55,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(2, 2),
                                    blurRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              border: Border.all(color: Colors.grey.shade100)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 35,
                                height: 35,
                                child: Image(
                                  image: AssetImage("assets/images/vip.png"),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  "Upgrade Account",
                                  style:
                                      TextStyle(fontSize: 17, fontFamily: 'kh'),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width - 40,
                          height: 55,
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 60,
                            //padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.green)),
                            child: Text(
                              "Verified",
                              style: TextStyle(
                                  color: Colors.green, fontFamily: 'kh'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpgradeScreen()));
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // InkWell(
                  //   child: Container(
                  //     padding: EdgeInsets.all(10),
                  //     width: MediaQuery.of(context).size.width - 40,
                  //     height: 55,
                  //     decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.grey.shade200,
                  //               offset: Offset(2, 2),
                  //               blurRadius: 1)
                  //         ],
                  //         color: white,
                  //         border: Border.all(color: Colors.grey.shade100),
                  //         borderRadius: BorderRadius.circular(5)),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //             child: Container(
                  //           child: Text(
                  //               AppLocalizations.of(context)!
                  //                   .translate('namecard')!,
                  //               style:
                  //                   TextStyle(fontSize: 17, fontFamily: 'kh')),
                  //         )),
                  //         Container(
                  //           width: 40,
                  //           height: 40,
                  //           child: Icon(
                  //             Icons.qr_code,
                  //             color: Colors.blue,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => NameCardScreen(
                  //                 BlocProvider.of<AccountBloc>(context)
                  //                     .accountModel!)));
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 55,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 2),
                                blurRadius: 1)
                          ],
                          color: white,
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('mybank')!,
                                style:
                                    TextStyle(fontSize: 17, fontFamily: 'kh')),
                          )),
                          Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.account_balance_outlined,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MybankScreen()));
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 55,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 2),
                                blurRadius: 1)
                          ],
                          color: white,
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate('mypoint')!,
                                style:
                                    TextStyle(fontSize: 17, fontFamily: 'kh')),
                          )),
                          Container(
                              width: 40,
                              height: 40,
                              child: Image(
                                image: AssetImage('assets/images/logobank.png'),
                              ))
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PointScreen()));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height * 0.35,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //     BoxShadow(
                        //       color: grey.withOpacity(0.3),
                        //       blurRadius: 10,
                        //       offset: Offset(2,4),
                        //     ),
                        //   ],
                        color: white,
                        border: Border.all(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/Bank/user-interface.png"))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  "Phone Top-Up",
                                  style:
                                      TextStyle(fontFamily: 'kh', fontSize: 17),
                                ),
                              )),
                              Container(
                                width: 35,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey.shade300,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        )),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/cars.png"))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('bankcard')!,
                                  style:
                                      TextStyle(fontFamily: 'kh', fontSize: 17),
                                ),
                              )),
                              Container(
                                width: 35,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey.shade300,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        )),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        Expanded(
                            child: InkWell(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/transac.png"))),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('trasaction')!,
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade300,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransactionScreen()));
                          },
                        )),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        Expanded(
                            child: InkWell(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Bank/add-user.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('invitefir')!,
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade300,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InviteScreen()));
                          },
                        )),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        Expanded(
                            child: InkWell(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Bank/globe.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('lang')!,
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade300,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            languageModal(context);
                          },
                        )),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        Expanded(
                            child: InkWell(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.contact_support_rounded,
                                    size: 35,
                                    color: Colors.teal,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('helpcenter')!,
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade300,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HelpCenter()));
                          },
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade100)),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/info.png"))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .translate('about')!,
                                  style:
                                      TextStyle(fontFamily: 'kh', fontSize: 17),
                                ),
                              )),
                              Container(
                                width: 35,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        )),
                        Container(
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                        Expanded(
                            child: InkWell(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('contact us')!,
                                    style: TextStyle(
                                        fontFamily: 'kh', fontSize: 17),
                                  ),
                                )),
                                Container(
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade300,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Contact(context);
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
