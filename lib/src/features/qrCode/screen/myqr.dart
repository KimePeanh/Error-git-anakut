import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/account/bloc/bloc/account_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class MyQRScreen extends StatefulWidget {
  const MyQRScreen({Key? key}) : super(key: key);

  @override
  _MyQRScreenState createState() => _MyQRScreenState();
}

class _MyQRScreenState extends State<MyQRScreen> {
  //final DrawableRoot svgRoot = await svg.fromSvgString(rawSvg, rawSvg);
  String? html;
  Future<void> getimage() async {
    String base =
        "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjUwMCIgaGVpZ2h0PSI1MDAiIHZpZXdCb3g9IjAgMCA1MDAgNTAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoMjMuODEpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xMCAwTDEwIDFMOCAxTDggN0w5IDdMOSA4TDUgOEw1IDlMMyA5TDMgOEwyIDhMMiAxMUw1IDExTDUgMTJMMyAxMkwzIDEzTDcgMTNMNyAxMkw4IDEyTDggMTZMOSAxNkw5IDE4TDggMThMOCAxOUw5IDE5TDkgMjBMMTAgMjBMMTAgMjFMMTUgMjFMMTUgMTdMMjEgMTdMMjEgMTZMMTkgMTZMMTkgMTVMMjAgMTVMMjAgMTNMMTkgMTNMMTkgMTJMMjEgMTJMMjEgMTBMMTcgMTBMMTcgMTFMMTYgMTFMMTYgMTJMMTcgMTJMMTcgMTRMMTYgMTRMMTYgMTNMMTUgMTNMMTUgMTFMMTQgMTFMMTQgOEwxMyA4TDEzIDlMMTIgOUwxMiA3TDEzIDdMMTMgNEwxMiA0TDEyIDNMMTMgM0wxMyAyTDEyIDJMMTIgMFpNOSAyTDkgNEwxMCA0TDEwIDVMOSA1TDkgN0wxMCA3TDEwIDlMOCA5TDggMTBMNyAxMEw3IDlMNiA5TDYgMTBMNSAxMEw1IDExTDYgMTFMNiAxMkw3IDEyTDcgMTFMOCAxMUw4IDEyTDkgMTJMOSAxM0wxMCAxM0wxMCAxNUwxMiAxNUwxMiAxNEwxMyAxNEwxMyAxN0wxMiAxN0wxMiAxNkwxMCAxNkwxMCAxN0wxMSAxN0wxMSAxOEw5IDE4TDkgMTlMMTAgMTlMMTAgMjBMMTQgMjBMMTQgMTRMMTMgMTRMMTMgMTJMMTQgMTJMMTQgMTFMMTMgMTFMMTMgMTBMMTEgMTBMMTEgMTNMMTAgMTNMMTAgMTJMOSAxMkw5IDEwTDEwIDEwTDEwIDlMMTEgOUwxMSA3TDEyIDdMMTIgNUwxMSA1TDExIDJaTTEwIDZMMTAgN0wxMSA3TDExIDZaTTE1IDhMMTUgOUwyMCA5TDIwIDhaTTAgOUwwIDEwTDEgMTBMMSA5Wk02IDEwTDYgMTFMNyAxMUw3IDEwWk0xMiAxMUwxMiAxMkwxMyAxMkwxMyAxMVpNMTcgMTFMMTcgMTJMMTkgMTJMMTkgMTFaTTAgMTJMMCAxM0wxIDEzTDEgMTJaTTExIDEzTDExIDE0TDEyIDE0TDEyIDEzWk0xOCAxNEwxOCAxNUwxOSAxNUwxOSAxNFpNMTYgMTVMMTYgMTZMMTcgMTZMMTcgMTVaTTExIDE4TDExIDE5TDEzIDE5TDEzIDE4Wk0xOCAxOEwxOCAxOUwxOSAxOUwxOSAyMEwxOCAyMEwxOCAyMUwyMSAyMUwyMSAyMEwyMCAyMEwyMCAxOUwyMSAxOUwyMSAxOFpNMTYgMTlMMTYgMjBMMTcgMjBMMTcgMTlaTTAgMEwwIDdMNyA3TDcgMFpNMSAxTDEgNkw2IDZMNiAxWk0yIDJMMiA1TDUgNUw1IDJaTTE0IDBMMTQgN0wyMSA3TDIxIDBaTTE1IDFMMTUgNkwyMCA2TDIwIDFaTTE2IDJMMTYgNUwxOSA1TDE5IDJaTTAgMTRMMCAyMUw3IDIxTDcgMTRaTTEgMTVMMSAyMEw2IDIwTDYgMTVaTTIgMTZMMiAxOUw1IDE5TDUgMTZaIiBmaWxsPSIjMDAwMDAwIi8+PC9nPjwvZz48L3N2Zz4K";
    html = """
<html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1">

      </head>
      <body>
        <img style='display:block; width:${MediaQuery.of(context).size.width * 0.45};height:${MediaQuery.of(context).size.width * 0.45};' id='base64image'
       src='data:image/svg+xml;base64, ${BlocProvider.of<AccountBloc>(context).accountModel!.qrcode!}' />
      </body>

    </html>

""";
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
    getimage();
    print(BlocProvider.of<AccountBloc>(context).accountModel!.qrcode!);
    //Future.delayed(Duration.zero, () => showAlert(context));
    //Uint8List bytes = Base64Decoder().convert(base);
    Uint8List _bytesImage;

    String _imgString =
        BlocProvider.of<AccountBloc>(context).accountModel!.qrcode!;

    _bytesImage = Base64Decoder().convert(_imgString);

    Uint8List _bytes = Base64Decoder().convert(
        "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjUwMCIgaGVpZ2h0PSI1MDAiIHZpZXdCb3g9IjAgMCA1MDAgNTAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoMjMuODEpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xMCAwTDEwIDFMOCAxTDggN0w5IDdMOSA4TDUgOEw1IDlMMyA5TDMgOEwyIDhMMiAxMUw1IDExTDUgMTJMMyAxMkwzIDEzTDcgMTNMNyAxMkw4IDEyTDggMTZMOSAxNkw5IDE4TDggMThMOCAxOUw5IDE5TDkgMjBMMTAgMjBMMTAgMjFMMTUgMjFMMTUgMTdMMjEgMTdMMjEgMTZMMTkgMTZMMTkgMTVMMjAgMTVMMjAgMTNMMTkgMTNMMTkgMTJMMjEgMTJMMjEgMTBMMTcgMTBMMTcgMTFMMTYgMTFMMTYgMTJMMTcgMTJMMTcgMTRMMTYgMTRMMTYgMTNMMTUgMTNMMTUgMTFMMTQgMTFMMTQgOEwxMyA4TDEzIDlMMTIgOUwxMiA3TDEzIDdMMTMgNEwxMiA0TDEyIDNMMTMgM0wxMyAyTDEyIDJMMTIgMFpNOSAyTDkgNEwxMCA0TDEwIDVMOSA1TDkgN0wxMCA3TDEwIDlMOCA5TDggMTBMNyAxMEw3IDlMNiA5TDYgMTBMNSAxMEw1IDExTDYgMTFMNiAxMkw3IDEyTDcgMTFMOCAxMUw4IDEyTDkgMTJMOSAxM0wxMCAxM0wxMCAxNUwxMiAxNUwxMiAxNEwxMyAxNEwxMyAxN0wxMiAxN0wxMiAxNkwxMCAxNkwxMCAxN0wxMSAxN0wxMSAxOEw5IDE4TDkgMTlMMTAgMTlMMTAgMjBMMTQgMjBMMTQgMTRMMTMgMTRMMTMgMTJMMTQgMTJMMTQgMTFMMTMgMTFMMTMgMTBMMTEgMTBMMTEgMTNMMTAgMTNMMTAgMTJMOSAxMkw5IDEwTDEwIDEwTDEwIDlMMTEgOUwxMSA3TDEyIDdMMTIgNUwxMSA1TDExIDJaTTEwIDZMMTAgN0wxMSA3TDExIDZaTTE1IDhMMTUgOUwyMCA5TDIwIDhaTTAgOUwwIDEwTDEgMTBMMSA5Wk02IDEwTDYgMTFMNyAxMUw3IDEwWk0xMiAxMUwxMiAxMkwxMyAxMkwxMyAxMVpNMTcgMTFMMTcgMTJMMTkgMTJMMTkgMTFaTTAgMTJMMCAxM0wxIDEzTDEgMTJaTTExIDEzTDExIDE0TDEyIDE0TDEyIDEzWk0xOCAxNEwxOCAxNUwxOSAxNUwxOSAxNFpNMTYgMTVMMTYgMTZMMTcgMTZMMTcgMTVaTTExIDE4TDExIDE5TDEzIDE5TDEzIDE4Wk0xOCAxOEwxOCAxOUwxOSAxOUwxOSAyMEwxOCAyMEwxOCAyMUwyMSAyMUwyMSAyMEwyMCAyMEwyMCAxOUwyMSAxOUwyMSAxOFpNMTYgMTlMMTYgMjBMMTcgMjBMMTcgMTlaTTAgMEwwIDdMNyA3TDcgMFpNMSAxTDEgNkw2IDZMNiAxWk0yIDJMMiA1TDUgNUw1IDJaTTE0IDBMMTQgN0wyMSA3TDIxIDBaTTE1IDFMMTUgNkwyMCA2TDIwIDFaTTE2IDJMMTYgNUwxOSA1TDE5IDJaTTAgMTRMMCAyMUw3IDIxTDcgMTRaTTEgMTVMMSAyMEw2IDIwTDYgMTVaTTIgMTZMMiAxOUw1IDE5TDUgMTZaIiBmaWxsPSIjMDAwMDAwIi8+PC9nPjwvZz48L3N2Zz4K");
    print(_bytes);
    final _byteImage = Base64Decoder().convert(
        "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjUwMCIgaGVpZ2h0PSI1MDAiIHZpZXdCb3g9IjAgMCA1MDAgNTAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoMjMuODEpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xMCAwTDEwIDFMOCAxTDggN0w5IDdMOSA4TDUgOEw1IDlMMyA5TDMgOEwyIDhMMiAxMUw1IDExTDUgMTJMMyAxMkwzIDEzTDcgMTNMNyAxMkw4IDEyTDggMTZMOSAxNkw5IDE4TDggMThMOCAxOUw5IDE5TDkgMjBMMTAgMjBMMTAgMjFMMTUgMjFMMTUgMTdMMjEgMTdMMjEgMTZMMTkgMTZMMTkgMTVMMjAgMTVMMjAgMTNMMTkgMTNMMTkgMTJMMjEgMTJMMjEgMTBMMTcgMTBMMTcgMTFMMTYgMTFMMTYgMTJMMTcgMTJMMTcgMTRMMTYgMTRMMTYgMTNMMTUgMTNMMTUgMTFMMTQgMTFMMTQgOEwxMyA4TDEzIDlMMTIgOUwxMiA3TDEzIDdMMTMgNEwxMiA0TDEyIDNMMTMgM0wxMyAyTDEyIDJMMTIgMFpNOSAyTDkgNEwxMCA0TDEwIDVMOSA1TDkgN0wxMCA3TDEwIDlMOCA5TDggMTBMNyAxMEw3IDlMNiA5TDYgMTBMNSAxMEw1IDExTDYgMTFMNiAxMkw3IDEyTDcgMTFMOCAxMUw4IDEyTDkgMTJMOSAxM0wxMCAxM0wxMCAxNUwxMiAxNUwxMiAxNEwxMyAxNEwxMyAxN0wxMiAxN0wxMiAxNkwxMCAxNkwxMCAxN0wxMSAxN0wxMSAxOEw5IDE4TDkgMTlMMTAgMTlMMTAgMjBMMTQgMjBMMTQgMTRMMTMgMTRMMTMgMTJMMTQgMTJMMTQgMTFMMTMgMTFMMTMgMTBMMTEgMTBMMTEgMTNMMTAgMTNMMTAgMTJMOSAxMkw5IDEwTDEwIDEwTDEwIDlMMTEgOUwxMSA3TDEyIDdMMTIgNUwxMSA1TDExIDJaTTEwIDZMMTAgN0wxMSA3TDExIDZaTTE1IDhMMTUgOUwyMCA5TDIwIDhaTTAgOUwwIDEwTDEgMTBMMSA5Wk02IDEwTDYgMTFMNyAxMUw3IDEwWk0xMiAxMUwxMiAxMkwxMyAxMkwxMyAxMVpNMTcgMTFMMTcgMTJMMTkgMTJMMTkgMTFaTTAgMTJMMCAxM0wxIDEzTDEgMTJaTTExIDEzTDExIDE0TDEyIDE0TDEyIDEzWk0xOCAxNEwxOCAxNUwxOSAxNUwxOSAxNFpNMTYgMTVMMTYgMTZMMTcgMTZMMTcgMTVaTTExIDE4TDExIDE5TDEzIDE5TDEzIDE4Wk0xOCAxOEwxOCAxOUwxOSAxOUwxOSAyMEwxOCAyMEwxOCAyMUwyMSAyMUwyMSAyMEwyMCAyMEwyMCAxOUwyMSAxOUwyMSAxOFpNMTYgMTlMMTYgMjBMMTcgMjBMMTcgMTlaTTAgMEwwIDdMNyA3TDcgMFpNMSAxTDEgNkw2IDZMNiAxWk0yIDJMMiA1TDUgNUw1IDJaTTE0IDBMMTQgN0wyMSA3TDIxIDBaTTE1IDFMMTUgNkwyMCA2TDIwIDFaTTE2IDJMMTYgNUwxOSA1TDE5IDJaTTAgMTRMMCAyMUw3IDIxTDcgMTRaTTEgMTVMMSAyMEw2IDIwTDYgMTVaTTIgMTZMMiAxOUw1IDE5TDUgMTZaIiBmaWxsPSIjMDAwMDAwIi8+PC9nPjwvZz48L3N2Zz4K");
    Widget image = Image.memory(_byteImage);
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height *0.1,
                child: Image(
                    // fit: BoxFit.cover,
                    image: AssetImage("assets/images/bar.png")),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
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
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 100,
                      height: 50,
                      child: Text(
                        AppLocalizations.of(context)!.translate("myqr")!,
                        style: TextStyle(
                            fontSize: 25,
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'kh'),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // QrImage(
                      //   data: '0887112932',
                      //   version: QrVersions.auto,
                      //   size: MediaQuery.of(context).size.width * 0.5,
                      // ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.5,
                        //child: Image.memory(bytes),
                        alignment: Alignment.center,
                        child: WebViewPlus(
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (controller) {
                            controller.loadString(html!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${BlocProvider.of<AccountBloc>(context).accountModel!.lastname}" +
                            " ${BlocProvider.of<AccountBloc>(context).accountModel!.firstname}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'kh',
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate("accNum")! +
                            " : ${BlocProvider.of<AccountBloc>(context).accountModel!.email}",
                        style: TextStyle(fontFamily: 'kh'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Flexible(
              child: SizedBox(
            height: 50,
          )),
          // Image(
          //     width: 150,
          //     height: 150,
          //     image: AssetImage("assets/images/Capture.PNG")),
          // QrImage(
          //   data: '0887112932',
          //   version: QrVersions.auto,
          //   size: MediaQuery.of(context).size.width*0.5,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   "Peanh Kime",
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //     fontFamily: 'kh',
          //   ),
          // ),
          // Text(
          //   AppLocalizations.of(context)!.translate("accNum")! +
          //       " : 0887112932",
          //   style: TextStyle(fontFamily: 'kh'),
          // ),
          // Spacer(
          //   flex: 1,
          // ),
          // Container(
          //   width: MediaQuery.of(context).size.width - 100,
          //   height: 50,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: mainColor,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.shade300,
          //           offset: Offset(0, 2),
          //         )
          //       ]),
          //   child: Row(
          //     children: <Widget>[
          //       Expanded(
          //         child: InkWell(
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(
          //                   Icons.save_alt,
          //                   color: white,
          //                 ),
          //                 SizedBox(
          //                   width: 5,
          //                 ),
          //                 Text(
          //                   AppLocalizations.of(context)!.translate("save")!,
          //                   style: TextStyle(
          //                       color: white,
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.bold,
          //                       fontFamily: 'kh'),
          //                 )
          //               ],
          //             ),
          //           ),
          //           onTap: () async {
          //             //   print('save click');
          //             //  final image= await screenshotController.capture();
          //             //  if (image == null) return;
          //             //  await saveImage(image);
          //           },
          //         ),
          //       ),
          //       Container(
          //         width: 1,
          //         color: white,
          //       ),
          //       Expanded(
          //         child: Container(
          //           alignment: Alignment.center,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Icon(
          //                 Icons.share,
          //                 color: white,
          //               ),
          //               SizedBox(
          //                 width: 5,
          //               ),
          //               Text(
          //                 AppLocalizations.of(context)!.translate("share")!,
          //                 style: TextStyle(
          //                     color: white,
          //                     fontSize: 16,
          //                     fontWeight: FontWeight.bold,
          //                     fontFamily: 'kh'),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      )),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 50, bottom: 20, right: 20),
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: mainColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, 2),
                )
              ]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.save_alt,
                          color: white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppLocalizations.of(context)!.translate("save")!,
                          style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'kh'),
                        )
                      ],
                    ),
                  ),
                  onTap: () async {
                    //   print('save click');
                    //  final image= await screenshotController.capture();
                    //  if (image == null) return;
                    //  await saveImage(image);
                  },
                ),
              ),
              Container(
                width: 1,
                color: white,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.share,
                        color: white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate("share")!,
                        style: TextStyle(
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'kh'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Submit"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Enter Amount",
                style: TextStyle(
                  fontFamily: 'kh',
                ),
              ),
              content: Container(
                //height: 150,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: "Amouont",
                    labelStyle: TextStyle(fontFamily: 'kh'),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                      gapPadding: 10,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.translate("phReq");
                    }
                    return null;
                  },
                ),
              ),
              actions: [
                cancelButton,
                continueButton,
              ],
            ));
  }

  Widget getImagenBase64(String imagen) {
    String _imageBase64 = imagen;
    const Base64Codec base64 = Base64Codec();
    if (_imageBase64 == null) return new Container();
    Uint8List bytes = base64.decode(_imageBase64);
    return Image.memory(
      bytes,
      width: 200,
      fit: BoxFit.fitWidth,
    );
  }

  showAlertDialogServicefee(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Save"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Service Fee"),
      content: Container(
        height: 180,
        child: Column(
          children: [],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
