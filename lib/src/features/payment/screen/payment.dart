import 'package:anakut_bank/src/features/payment/bloc/cate_bloc/bloc/company_cate_bloc.dart';
import 'package:anakut_bank/src/features/payment/screen/cate_detail.dart';
import 'package:anakut_bank/src/features/payment/screen/payment_history.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forex_conversion/forex_conversion.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CompanyCateBloc companyCateBloc = CompanyCateBloc();

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  //final fx = Forex();
  String hi = "";
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    companyCateBloc.add(FetchCateStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          "Bill Payment",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentHistory()));
                },
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      // body:
      // CustomScrollView(
      //   slivers: [
      //     SliverFillRemaining(
      //       hasScrollBody: false,
      //       child: Center(
      //         child: Column(
      //           children: [
      //             SizedBox(
      //               height: 30,
      //             ),
      //             // transfertype(context, "assets/images/phone.png", "Mobile Top-up"),
      //             // transfertype(context, "assets/images/wrench.png", "Utilities"),
      //             // transfertype(context, "assets/images/mortarboard.png", "Education"),
      //             // transfertype(context, "assets/images/shopping-cart.png", "Shop"),
      //             // Container(
      //             //   width: MediaQuery.of(context).size.width* 0.95,
      //             //   height: MediaQuery.of(context).size.height * 0.15,
      //             //   child: Row(
      //             //     children: <Widget>[
      //             //       Expanded(child: CateWidget("assets/images/utility.png", "UTILITIES", Color(0xffff8080).withOpacity(0.3), context)),
      //             //       SizedBox(width: 10,),
      //             //       Expanded(child: CateWidget("assets/images/bank.png", "FINANCE", Color(0xff154360).withOpacity(0.3), context)),
      //             //     ],
      //             //   ),
      //             // ),
      //             // SizedBox(height: 10,),
      //             // Container(
      //             //   width: MediaQuery.of(context).size.width* 0.95,
      //             //   height: MediaQuery.of(context).size.height * 0.15,
      //             //   child: Row(
      //             //     children: <Widget>[
      //             //       Expanded(child: CateWidget("assets/images/world-grid.png", "INTERNET", Colors.blue.withOpacity(0.3), context)),
      //             //       SizedBox(width: 10,),
      //             //       Expanded(child: CateWidget("assets/images/diploma.png", "EDUCATION", Colors.amber.withOpacity(0.3), context)),
      //             //     ],
      //             //   ),
      //             // ),
      //             // SizedBox(height: 10,),
      //             // Container(
      //             //   width: MediaQuery.of(context).size.width* 0.95,
      //             //   height: MediaQuery.of(context).size.height * 0.15,
      //             //   child: Row(
      //             //     children: <Widget>[
      //             //       Expanded(child: CateWidget("assets/images/more.png", "OTHERS", Color(0xffC39BD3).withOpacity(0.3), context)),
      //             //       SizedBox(width: 10,),
      //             //       Expanded(child: Container()),
      //             //     ],
      //             //   ),
      //             // ),
      //             Container(
      //               height: MediaQuery.of(context).size.height * 0.11,
      //               width: MediaQuery.of(context).size.width * 0.92,
      //               child: Row(
      //                 children: <Widget>[
      //                   Expanded(
      //                       child: cate(
      //                     context,
      //                     "assets/images/utility.png",
      //                     "UTILITIES",
      //                     Color(0xffff8080).withOpacity(0.3),
      //                   )),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Expanded(
      //                       child: cate(context, "assets/images/bank.png",
      //                           "FINANCE", Color(0xff154360).withOpacity(0.3))),
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Container(
      //               height: MediaQuery.of(context).size.height * 0.11,
      //               width: MediaQuery.of(context).size.width * 0.92,
      //               child: Row(
      //                 children: <Widget>[
      //                   Expanded(
      //                       child: cate(context, "assets/images/world-grid.png",
      //                           "INTERNET", Colors.blue.withOpacity(0.3))),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Expanded(
      //                       child: cate(
      //                     context,
      //                     "assets/images/diploma.png",
      //                     "EDUCATION",
      //                     Colors.amber.withOpacity(0.3),
      //                   )),
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Container(
      //               height: MediaQuery.of(context).size.height * 0.11,
      //               width: MediaQuery.of(context).size.width * 0.92,
      //               child: Row(
      //                 children: <Widget>[
      //                   Expanded(
      //                       child: cate(context, "assets/images/more.png",
      //                           "OTHERS", Color(0xffC39BD3).withOpacity(0.3))),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Expanded(child: Container()),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: BlocConsumer(
        bloc: companyCateBloc,
        listener: (context, state) {
          if (state is FetchedCate) {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
          if (state is EndCate) {
            _refreshController.loadNoData();
          }
        },
        builder: (context, st) {
          if (st is FetchingCate) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (st is ErrorFetchCate) {
            return Text(st.e.toString());
          }

          return SmartRefresher(
            cacheExtent: 1,
            // cacheExtent: 500,
            physics: AlwaysScrollableScrollPhysics(),
            onRefresh: () {
              companyCateBloc.add(FetchCateStarted());
            },
            onLoading: () {
              if (st is EndCate) {
              } else {
                companyCateBloc.add(RefreshCate());
              }
            },
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: companyCateBloc.Cate.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      width: width * 0.9,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        )
                      ]),
                      child: Text(
                        companyCateBloc.Cate[index].category_name,
                        style: TextStyle(fontFamily: 'kh'),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CateDetail(getCate: companyCateBloc.Cate, index: index,)));
                    },
                  );
                }),
          );
        },
      ),
    );
  }
}
