import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServiceFee extends StatefulWidget {
  const ServiceFee({Key? key}) : super(key: key);

  @override
  State<ServiceFee> createState() => _ServiceFeeState();
}

class _ServiceFeeState extends State<ServiceFee> {
  @override
  Widget build(BuildContext context) {
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
          "Service Fee",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1,
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
                padding: EdgeInsets.only(top: 8, bottom: 8),
                width: MediaQuery.of(context).size.width * 0.95,
                //height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: Offset(2, 2),
                          blurRadius: 5)
                    ]),
                child: ListTile(
                  leading: Container(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.height * 0.045,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff7F0194),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff7F0194),
                              offset: Offset(0.5, 0.5),
                              blurRadius: 5,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height:
                                  MediaQuery.of(context).size.height * 0.030,
                              image: AssetImage(
                                  "assets/images/Bank/exchange.png")),
                        ],
                      )),
                  title: Text("Money Exchange fee", style: TextStyle(fontWeight: bold),textScaleFactor: 1,),
                  subtitle: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '1\$-100\$'),
                                TextSpan(
                                  text: '            Fee 1\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '100\$-1000\$'),
                                TextSpan(
                                  text: '      Fee 1.5\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '100\$-1000\$'),
                                TextSpan(
                                  text: '      Fee 1.5\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  trailing: IconButton(icon: Icon(Icons.edit, color: Color(0xffFF3E61),),onPressed: (){

                  },),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                width: MediaQuery.of(context).size.width * 0.95,
                //height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: Offset(2, 2),
                          blurRadius: 5)
                    ]),
                child: ListTile(
                  leading: Container(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.height * 0.045,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff7F0194),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff7F0194),
                              offset: Offset(0.5, 0.5),
                              blurRadius: 5,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height:
                                  MediaQuery.of(context).size.height * 0.030,
                              image: AssetImage(
                                  "assets/images/Bank/exchange.png")),
                        ],
                      )),
                  title: Text("Money Exchange fee", style: TextStyle(fontWeight: bold),textScaleFactor: 1,),
                  subtitle: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '1\$-100\$'),
                                TextSpan(
                                  text: '            Fee 1\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '100\$-1000\$'),
                                TextSpan(
                                  text: '      Fee 1.5\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '100\$-1000\$'),
                                TextSpan(
                                  text: '      Fee 1.5\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  trailing: IconButton(icon: Icon(Icons.edit, color: Color(0xffFF3E61),),onPressed: (){

                  },),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:  Color(0xff029E24),
        ),
        child: Icon(Icons.add, color: white,size: 30,),
      ),
    );
  }
}
