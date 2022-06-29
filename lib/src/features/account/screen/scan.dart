import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class ScanNameCard extends StatefulWidget {
  const ScanNameCard({ Key? key }) : super(key: key);

  @override
  State<ScanNameCard> createState() => _ScanNameCardState();
}

class _ScanNameCardState extends State<ScanNameCard> {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
      void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
       if (scanData.code != null){
         print("Scan screen");
         print(scanData.code.toString());
        //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TransferScreen(0, scanData.code.toString(),"","","qr", "")));
       }
    
    });
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
        title: Text("Scan"),
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