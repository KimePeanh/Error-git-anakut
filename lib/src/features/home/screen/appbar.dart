import 'package:anakut_bank/src/features/Edit%20Profile/screen/edit_profile.dart';
import 'package:anakut_bank/src/features/home/bloc/search/bloc/search_bloc.dart';
import 'package:anakut_bank/src/features/home/screen/searchScreen.dart';
import 'package:anakut_bank/src/features/menu/screen/newMenu.dart';
import 'package:anakut_bank/src/features/notification/screen/notificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_localiztion.dart';
import '../../../shared/widgets/widget.dart';
import '../../../utils/constants/app_constants.dart';
import '../../language/screen/languages.dart';
import '../../pin/sccreen/pin.dart';
import '../../qrCode/screen/myqr.dart';

class HomepageAppBar extends StatefulWidget {
  const HomepageAppBar({Key? key}) : super(key: key);

  @override
  _HomepageAppBarState createState() => _HomepageAppBarState();
}

class _HomepageAppBarState extends State<HomepageAppBar> {
  late GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      alignment: Alignment.center,
      key: _key,
      padding: EdgeInsets.only(left: 5, right: 5),
      width: MediaQuery.of(context).size.width,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: white.withOpacity(0.4)),
              child: InkWell(
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: white,
                ),
                onTap: () {
                  //Scaffold.of(context).openDrawer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuSideScreen()));
                },
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(child: search(context)),
          SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              InkWell(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: white.withOpacity(0.4)),
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                    color: white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
              ),
              Container(
                alignment: Alignment.topRight,
                width: 40,
                height: 40,
                child: Column(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red
                      ),
                    ),
                  ],
                ),
              )
            ],
          )

          // Flexible(
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.qr_code_2_rounded,
          //       size: 30,
          //       color: white,
          //     ),
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => MyQRScreen()));
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  TextEditingController searchController = TextEditingController();
  Widget search(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width - 90,
        height: 38,
        alignment: Alignment.center,
        // child: TextFormField(
        //   //controller: searchController,
        //   textAlignVertical: TextAlignVertical.center,
        //   decoration: InputDecoration(
        //       contentPadding: EdgeInsets.only(top: 5),
        //       prefixIcon: Icon(Icons.search),
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(20),
        //           borderSide: BorderSide.none),
        //       fillColor: white,
        //       filled: true,
        //       hintStyle: TextStyle(fontFamily: 'kh', height: 1),
        //       hintText: AppLocalizations.of(context)!.translate("search")!),
        //   // onChanged: (value) {
        //   //   print(value);
        //   //   //searchController.text = value;
        //   //   BlocProvider.of<SearchBloc>(context)
        //   //       .add(SearchStarted(query: value));

        //   // },
        //   // onSaved: (newValue) {
        //   //  // print(newValue);
        //   // },
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => SearchScreen()));
        //   },
        // ),
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: 50,
              child: Icon(
                Icons.search,
                color: grey,
              ),
            ),
            Expanded(
                child: Container(
              child: Text(
                AppLocalizations.of(context)!.translate("search")!,
                style: TextStyle(color: grey, fontFamily: 'kh'),
              ),
            ))
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchScreen()));
      },
    );
  }

  Drawer sidemenu() => Drawer(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 110,
        color: white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width - 80,
              height: 160,
              color: mainColor,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  pff(),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'kh'),
                      ),
                      Text(
                        "0887112932",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'kh'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 1,
              color: white,
            ),
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                height: MediaQuery.of(context).size.height - 191,
                color: white,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Row(
                          children: [
                            Flexible(
                                child: Container(
                              width: 50,
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.home,
                                  color: mainColor,
                                ),
                                iconSize: 25,
                              ),
                            )),
                            Flexible(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      AppLocalizations.of(context)!
                                          .translate("home")!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
                                          color: csblack,
                                          fontFamily: 'kh'))),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            width: 50,
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.qr_code),
                              iconSize: 25,
                              color: Colors.blueGrey,
                            ),
                          )),
                          Flexible(
                              child: InkWell(
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("myqr")!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: csblack,
                                        fontFamily: 'kh'))),
                            onTap: () {},
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            width: 50,
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                              iconSize: 25,
                              color: Colors.pink,
                            ),
                          )),
                          Flexible(
                              child: InkWell(
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("editpf")!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: csblack,
                                        fontFamily: 'kh'))),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfileScreen()));
                            },
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            width: 50,
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.language),
                              iconSize: 25,
                              color: Colors.blue,
                            ),
                          )),
                          Flexible(
                              child: InkWell(
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("lang")!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: csblack,
                                        fontFamily: 'kh'))),
                            onTap: () {
                              languageModal(context);
                            },
                          ))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            width: 50,
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                              iconSize: 25,
                              color: Colors.pink,
                            ),
                          )),
                          Flexible(
                              child: InkWell(
                            child: Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("setting")!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold,
                                        color: csblack,
                                        fontFamily: 'kh'))),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfileScreen()));
                            },
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            width: 50,
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                color: Colors.green,
                              ),
                              iconSize: 25,
                            ),
                          )),
                          Flexible(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      AppLocalizations.of(context)!
                                          .translate("contact us")!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
                                          color: csblack,
                                          fontFamily: 'kh'))))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            width: 50,
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.help_center),
                              iconSize: 25,
                              color: Colors.orange,
                            ),
                          )),
                          Flexible(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      AppLocalizations.of(context)!
                                          .translate("help")!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
                                          color: csblack,
                                          fontFamily: 'kh'))))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            width: 50,
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.logout),
                              iconSize: 25,
                              color: Colors.red,
                            ),
                          )),
                          Flexible(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      AppLocalizations.of(context)!
                                          .translate("logout")!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          //fontWeight: FontWeight.bold,
                                          color: csblack,
                                          fontFamily: 'kh'))))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
