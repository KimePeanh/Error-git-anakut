import 'dart:io';
import 'package:anakut_bank/src/features/reciept/bloc/bloc/reciept_bloc.dart';
import 'package:anakut_bank/src/features/reciept/screen/pdf.dart';
import 'package:anakut_bank/src/features/reciept/setting/bloc/index.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:anakut_bank/src/utils/service/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'dart:developer' as d;

class NewReciept extends StatefulWidget {
  final int id;
  NewReciept({required this.id});

  @override
  State<NewReciept> createState() => _NewRecieptState();
}

class _NewRecieptState extends State<NewReciept> {
  int s = 0;
  String? generatedPdfFilePath;
  bool isLoading = true;
  bool isLoading2 = true;
  File? generatedPdfFile;
  // RecieptBloc recieptBloc = RecieptBloc();
  String? htmlContent;
  String? htmlContents;
  String? html;
  Storage storage = Storage();
  File? logoImageFile;
  File? noteImageFile;
  String? logoImageBase64Image;
  String? noteImageBase64Image;
  String title = " ";
  RecieptBloc recieptBloc = RecieptBloc();
  // MoneyFormatter? fm;
  @override
  void initState() {    
    recieptBloc.add(FetchRecieptEven(id: widget.id));
    super.initState();
  }

  // Future<void> generateExampleDocument() async {
  //   DateTime now = DateTime.now();
  //   String month = now.month.toString();
  //   String day = now.day.toString();
  //   String hour = now.hour.toString();
  //   String minute = now.minute.toString();
  //   String second = now.second.toString();
  //   if (now.month < 10) {
  //     month = "0" + now.month.toString();
  //   }
  //   if (now.day < 10) {
  //     day = "0" + now.day.toString();
  //   }
  //   if (now.hour < 10) {
  //     hour = "0" + now.hour.toString();
  //   }
  //   if (now.minute < 10) {
  //     minute = "0" + now.minute.toString();
  //   }
  //   if (now.second < 10) {
  //     second = "0" + now.second.toString();
  //   }
  //   String date = "${now.year}-$month-$day $hour:$minute:$second";
  //   // widget.cart.date = date;

  //   String unique =
  //       now.year.toString().substring(2, now.year.toString().length) +
  //           now.month.toString() +
  //           now.day.toString() +
  //           now.hour.toString() +
  //           now.minute.toString() +
  //           now.second.toString();

  //   String itemData = "";
  //   itemData += """<div class="itemData">
  //         <div style = "width:35%;font-size: 50">${recieptBloc.recieptModel.create_date}</div>
  //         <div style = "width:15%;text-align:center;font-size: 50">\$${recieptBloc.recieptModel.amount_in}</div>
  //         <div style = "width:25%;text-align:center;font-size: 50">${recieptBloc.recieptModel.amount_out}</div>
  //         <div style = "width:25%;text-align:right;font-size: 50">\$${recieptBloc.recieptModel.rate}</div>
  //       </div>""";
  //   htmlContent = """
  //   <html>
  //           <head><meta name="viewport" content="width=device-width, initial-scale=1">

  //     </head>

  //   </html>

  //  """;
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   var targetPath = appDocDir.path;
  //   var targetFileName = "invoice-pdf";

  //   generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
  //       htmlContent!, targetPath, targetFileName);
  //   generatedPdfFilePath = generatedPdfFile!.path;

  //   itemData = "";
  //   itemData += """<div class="itemData">
  //         <div style = "width:35%;font-size: 50">${recieptBloc.recieptModel.currencyInModel!.createAt}</div>
  //         <div style = "width:15%;text-align:center;font-size: 50">\$${recieptBloc.recieptModel.amount_in}</div>
  //         <div style = "width:25%;text-align:center;font-size: 50">${recieptBloc.recieptModel.amount_out}</div>
  //         <div style = "width:25%;text-align:right;font-size: 50">\$${recieptBloc.recieptModel.rate}</div>
  //       </div>""";
  //   htmlContents = """

  //   <html>
  //     <head><meta name="viewport" content="width=device-width, initial-scale=1">
  //       <style>
  //        html {
  //           width:100%;
  //         padding: 0;
  //         margin:0;
  //          background-color: #fefbd8;

  //         }
  //         #title{
  //         font-size:40px;
  //         font-weight:bold;
  //         text-align:center;
  //         margin-top:5px;
  //       }
  //       #subTitle{
  //         margin-top:0px;
  //         font-size:30px;
  //         font-weight:bold;
  //         text-align:center;
  //       }
  //       #noteTitle{
  //         margin-top:0px;
  //         font-size:28px;
  //         font-weight:bold;
  //         text-align:center;
  //       }
  //       #noteBody{
  //         letter-spacing: 0px;
  //         margin-top:0px;
  //         font-size:22px;
  //         text-align:center;
  //       }
  //       .regularContent{
  //         font-size:25px;
  //         font-family: 'Ubuntu', sans-serif;
  //       }
  //       .regularContent p{
  //         padding: 10px 0px 0px 0px;
  //         margin:0px;
  //       }
  //       hr {
  //         border: none;
  //         border-top: 1px dotted black;
  //       }
  //       .flex-container {
  //         display: flex;
  //          margin: 10px;
  //         padding: 10px;
  //        }
  //       .flex-container div{
  //        text-align:center;
  //         font-size:22px;
  //       }
  //       .itemData{
  //         display: flex;
  //        }
  //        .itemData div{
  //         font-size:18px;
  //       }
  //       .billDetail p{
  //          padding: 10px 0px 0px 0px;
  //         margin:0px;
  //       }
  //       </style>
  //     </head>
  //    <body>
  //       <p>Hiiii</p>
  //    </body>
  //   </html>
  //   """;
  //   if (isLoading == true) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }
  double _manipulatedSize(BuildContext context, double size) {
    final String? fontSize =
        BlocProvider.of<SettingBloc>(context).state.fontSize;
    double _size = size;
    if (fontSize != null) {
      d.log(fontSize.toLowerCase());
      switch (fontSize.toLowerCase()) {
        case "small":
          _size = size - (size * 10 / 100);
          break;
        case "smallest":
          _size = size - (size * 20 / 100);
          break;
        case "large":
          _size = size + (size * 7 / 100);
          break;
        case "largest":
          _size = size + (size * 14 / 100);
          break;
        default:
          break;
      }
    }
    return _size;
  }

  Future<void> generateExampleDocument() async {
    // final User user = await storage.getCurrentUser();
    // final double usdPay =
    //     widget.cart.rielPay / Cart.usdToRielRate + widget.cart.usdPay;
    // final double rielPay = usdPay * Cart.usdToRielRate;
    DateTime now = DateTime.now();
    String month = now.month.toString();
    String day = now.day.toString();
    String hour = now.hour.toString();
    String minute = now.minute.toString();
    String second = now.second.toString();
    if (now.month < 10) {
      month = "0" + now.month.toString();
    }
    if (now.day < 10) {
      day = "0" + now.day.toString();
    }
    if (now.hour < 10) {
      hour = "0" + now.hour.toString();
    }
    if (now.minute < 10) {
      minute = "0" + now.minute.toString();
    }
    if (now.second < 10) {
      second = "0" + now.second.toString();
    }
    String date = "${now.year}-$month-$day $hour:$minute:$second";
    // widget.cart.date = date;

    String unique =
        now.year.toString().substring(2, now.year.toString().length) +
            now.month.toString() +
            now.day.toString() +
            now.hour.toString() +
            now.minute.toString() +
            now.second.toString();
    // widget.cart.invoiceNo = "M${user.id}/" + "$unique";

    String itemData = "";
    itemData += """<div class="itemData">
          <div style = "width:35%;font-size: 50">${BlocProvider.of<RecieptBloc>(context).recieptModel!.create_date}</div>
          <div style = "width:15%;text-align:center;font-size: 50">\$${BlocProvider.of<RecieptBloc>(context).recieptModel!.amount_in}</div>
          <div style = "width:25%;text-align:center;font-size: 50">${BlocProvider.of<RecieptBloc>(context).recieptModel!.amount_out}</div>
        </div>""";
    htmlContent = """
    
<html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1">

      </head>
      <div id ="body">
       
      </div>

    </html>
    """;

    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // var targetPath = appDocDir.path;
    // var targetFileName = "invoice-pdf";

    // generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
    //     htmlContent!, targetPath, targetFileName);
    // generatedPdfFilePath = generatedPdfFile!.path;
    // _saleBloc.add(AddSale(cart: widget.cart));

    //////////////////////////////////////////////////////////////////////
    ///
    ///
    ///
    ///
    ///

    itemData = "";
    itemData += """<div class="itemData">
          <div style = "width:35%;font-size: 50">${BlocProvider.of<RecieptBloc>(context).recieptModel!.create_date}</div>
          <div style = "width:15%;text-align:center;font-size: 50">\$${BlocProvider.of<RecieptBloc>(context).recieptModel!.amount_in}</div>
          <div style = "width:25%;text-align:center;font-size: 50">${BlocProvider.of<RecieptBloc>(context).recieptModel!.amount_out}</div>
        </div>""";
    htmlContents = """
    
    <html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1">
     <style>
     html{
       width: 100%;
       padding: 0px;
     }
          #queue{ 
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 85)}"
            : "${_manipulatedSize(context, 75)}") +
        """px;
          text-align:center;
          margin-top:10px;
          margin-bottom:25px;
          }
          #title{ 
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 25)}"
            : "${_manipulatedSize(context, 20)}") +
        """px;
          font-weight:bold;
          text-align:center;
          margin-top:10px;
        }
         #subTitle{ 
          margin-top:0px;
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 57)}"
            : "${_manipulatedSize(context, 42)}") +
        """px;
          font-weight:bold;
          text-align:center;
        }
        #noteTitle{
          margin-top:20px;
          margin-top:0px;
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 12)}"
            : "${_manipulatedSize(context, 10)}") +
        """px;
          font-weight:bold;
          text-align:center;
        }
        #noteBody{
          margin-top:10px;
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 47)}"
            : "${_manipulatedSize(context, 32)}") +
        """px;
          text-align:center;
        }
        .regularContent{
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 47)}"
            : "${_manipulatedSize(context, 32)}") +
        """px;
          font-family: 'Ubuntu', sans-serif;
        } 
        .regularContent p{
          padding: """ +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "10"
            : "1") +
        """px 0px 0px 0px;
          margin:0px;
        }
        hr {
            height:5px;
          border: none;
          border-top: 1px dotted black;
        }
        .flex-container {
          display: flex;
            margin: 10px 0px 10px 0px;
          padding: """ +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "10px 0px 10px 0px"
            : "0") +
        """px;
         }
        .flex-container div{
         text-align:center;
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 45)}"
            : "${_manipulatedSize(context, 28)}") +
        """px;
        }
        .itemData{
          display: flex;
         
         }
         .itemData div{
          font-size:""" +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 41)}"
            : "${_manipulatedSize(context, 27)}") +
        """px;
        }
        .billDetail p{
           padding: 
           """ +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "10"
            : "0") +
        """px 0px 0px 0px;
          margin:0px;
          font-size: """ +
        ((BlocProvider.of<SettingBloc>(context).state.printerSize == "58" ||
                BlocProvider.of<SettingBloc>(context).state.printerSize == null)
            ? "${_manipulatedSize(context, 43)}"
            : "${_manipulatedSize(context, 32)}") +
        """px;
        }
         #text{ 
          width: 100%
           margin:0px;
           font-size:12px; 
           
          } 
        #body{    
          width: 100%
           margin: -20px; 
          padding: 0px;
          } 
         
        </style>
      </head>
      <div id ="body">
        <p id = "title">${BlocProvider.of<RecieptBloc>(context).recieptModel!.counter_name}</p>
       <hr></hr>
       <div id = "text">
        <p >Invoice No : ANK${recieptBloc.recieptModel!.money_exchange_id}<p/>
        <p >Exchange Date : $date<p/>
        <p >Purchase Money : ${recieptBloc.recieptModel!.amount_in} ${recieptBloc.recieptModel!.currencyInModel!.code}<p/>
         <p >Purchase Rate : ${recieptBloc.recieptModel!.rate}<p/>
        <p >Sale Money : ${recieptBloc.recieptModel!.amount_out!} ${recieptBloc.recieptModel!.currencyOutModel!.code}<p/>
        </div>
        <hr></hr>
         <div id = "noteTitle">
        <p >Expires on $date<p/>
        <p >Be Sure to check befoore leaving<p/>
        <p >We are not responsible for any departure from our store.<p/>
        </div>
       <hr></hr>
      <div style ="height:30px;"> </div>
      </div>
    </html>
    """;
    html = """ 
    <head><meta name="viewport" content="width=device-width, initial-scale=1">
    
    <html>

    </html>
    
    
     """;
    if (isLoading == true) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecieptBloc>(context).add(FetchRecieptEven(id: widget.id));
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        title: Text(title),
      ),
      body: Column(
        children: [
          // SearchPage(),
          Expanded(
            child: BlocBuilder<RecieptBloc, RecieptState>(
              builder: (context, state) {
                if (state is FetchingReciept) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FetchedREciept) {
                   //fm = MoneyFormatter(amount: double.parse(recieptBloc.recieptModel!.amount_out!));
                  generateExampleDocument();

                  return (isLoading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : WebViewPlus(
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (controller) {
                            controller.loadString(htmlContents!);
                          },
                        );
                  //return Text("data");
                } else {
                 // title = "ANK${recieptBloc.recieptModel!.money_exchange_id}";
                  return Center(
                    child: TextButton(
                      child: Text("Retry"),
                      onPressed: () {
                        BlocProvider.of<RecieptBloc>(context)
                            .add(FetchRecieptEven(id: widget.id));
                      },
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () async {
          // await FlutterPdfPrinter.printFile(generatedPdfFilePath!);
          await Printing.layoutPdf(
              onLayout: (format) async => await Printing.convertHtml(
                    format: format.portrait,
                    // html: htmlContents!,
                    html:
                        htmlContents!,
                  ));
        },
        child: Icon(
          Icons.print,
        ),
      ),
    );
  }

  @override
  void dispose() {
    recieptBloc.close();
    super.dispose();
  }
}
