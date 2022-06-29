import 'package:anakut_bank/src/shared/widgets/widget.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../transfer/screen/transferScreen.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({Key? key}) : super(key: key);

  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  //String _result = "";
  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
  // checkingValue() {
  //   if (_result != null || _result != "") {
  //     print(_result);
  //     if (_result.contains("https") || _result.contains("http")) {
  //       return _launchURL(_result);
  //     } else {
  //       Fluttertoast.showToast(msg: "invalid url");
  //     }
  //   } else {
  //     return null;
  //   }
  // }

  // _launchURL(String urlQRCode) async {
  //   String url = urlQRCode;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
       if (scanData.code != null){
         print("Scan screen");
         print(scanData.code.toString());
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TransferScreen(0, scanData.code.toString(),"","","qr", "")));
       }
    
    });
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: mainColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: mainColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,color: white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Scan",style: TextStyle(fontSize: 25, color: white,fontWeight: FontWeight.bold,fontFamily: 'kh'),),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: mainColor,
                        borderLength: 20,
                        borderWidth: 10,
                        cutOutSize: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }

}
