import 'dart:async';

import 'package:anakut_bank/src/features/qrCode/screen/myqr.dart';
import 'package:anakut_bank/src/features/transfer/screen/transfer_choice.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../../../../app_localiztion.dart';
import '../../../shared/widgets/widget.dart';
import '../../../utils/constants/app_constants.dart';
import '../../coin/screen/coin.dart';
import '../../exchnage/screen/moneyXchange.dart';
import '../../payment/screen/payment.dart';
import '../../qrCode/screen/scanqr.dart';
import '../../transfer/screen/transferScreen.dart';
import '../../wallet/screen/wallet.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  String storedPasscode = '1234';
  var choice;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width - 50,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFEF2D5).withOpacity(1),
                //color: white.withOpacity(0.3)
              ),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(AppLocalizations.of(context)!.translate('send')!,
                              style: TextStyle(
                                fontFamily: 'kh',
                                color: Colors.black,
                                fontSize: 17,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.call_made,
                            color: Color(0xffA70000),
                            size: 35,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        choice = "transfer";
                      });
                      _showLockScreen(
                        context,
                        opaque: false,
                        cancelButton: Text(
                          'Cancel',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                          semanticsLabel: 'Cancel',
                        ),
                      );
                    },
                  )),
                  Container(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundColor: mainColor,
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    child: Container(
                      //alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call_received,
                            color: Color(0xff40A71C),
                            size: 35,
                          ),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.translate('receive')!,
                              style: TextStyle(
                                fontFamily: 'kh',
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyQRScreen()));
                    },
                  ))
                ],
              ),
            ),
          ),
          Center(
            child: InkWell(
              child: Container(
                width: 78,
                height: 78,
                child: CircleAvatar(
                  backgroundColor: mainColor,
                  child: Container(
                    width: 72,
                    height: 72,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff7F0194),
                      //backgroundColor: Colors.red.shade800,
                      child: Icon(
                        Icons.qr_code_scanner_sharp,
                        color: white,
                        size: 45,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  choice = "qr";
                });
                _showLockScreen(
                  context,
                  opaque: false,
                  cancelButton: Text(
                    'Cancel',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    semanticsLabel: 'Cancel',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Container(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/pf.jpg")),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Peanh Kime",
                      style: TextStyle(
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'kh'),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Enter PIN",
                      style: TextStyle(
                          fontSize: 17, color: white, fontFamily: 'kh'),
                    ),
                  ),
                ],
              ),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _onPasscodeEntered,
            cancelButton: cancelButton,
            deleteButton: Text(
              'Delete',
              style: const TextStyle(
                  fontSize: 16, color: Colors.white, fontFamily: 'kh'),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _onPasscodeCancelled,
            digits: digits,
            passwordDigits: 4,
            //bottomWidget: _buildPasscodeRestoreButton(),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    if (enteredPasscode == "1234") {
      if (choice == "Wallet") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WalletScreen()));
      } else if (choice == "transfer") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TransferScreen(0,"","","","","")));
      } else if (choice == "money") {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => MoneyExchnageScreen()));
      } else if (choice == "qr") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ScanQRScreen()));
      } else if (choice == "payment") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => PaymentScreen()));
      } else if (choice == "coin") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CoinScreen()));
      }
    } else {
      //  for (int i = 0; i<=2; i++){
      //    Navigator.maybePop(context);
      //  }
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}
