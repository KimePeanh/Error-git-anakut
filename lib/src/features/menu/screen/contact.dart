import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Contact(BuildContext context) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          color: white,
          child: Center(
            child: Column(
              children: [
                 CupertinoButton(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("Cancel"
                       
                        ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                ),
                Expanded(child: Container(
                  width: MediaQuery.of(context).size.width- 100,
                  child: Row(
                    children: [
                      Expanded(child: CupertinoButton(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green
                              ),
                              child: Icon(Icons.call,color: Colors.white, size: 40,),
                            ),
                            SizedBox(height: 10,),
                            //Text("Phone",style: TextStyle(fontSize: 18),)
                             Text("Phone",style: TextStyle(fontSize: 18,color: Colors.black),),
                          ],
                        ),
                        onPressed:() {
                          launch('tel:0${10601168}');
                        }
                      )),
                      Expanded(child: CupertinoButton(
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: grey.withOpacity(0.2)
                              ),
                              child: Image(image: AssetImage("assets/images/Telegram.svg"),)
                            ),
                            SizedBox(height: 10,),
                            //Text("Phone",style: TextStyle(fontSize: 18),)
                             Text("Phone",style: TextStyle(fontSize: 18,color: Colors.black),), 
                          ],
                        ),
                        onPressed:() {}
                      )),
                      Expanded(child: CupertinoButton(
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: grey.withOpacity(0.2)
                              ),
                              child: Image(image: AssetImage("assets/images/fb.jpg"),)
                            ),
                            SizedBox(height: 10,),
                            //Text("Phone",style: TextStyle(fontSize: 18),)
                           Text("Facebook",style: TextStyle(fontSize: 18,color: Colors.black),), 
                          ],
                        ),
                        onPressed:() {}
                      )),
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      });
}
