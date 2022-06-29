import 'package:anakut_bank/src/features/payment/bloc/cate_bloc/bloc/company_cate_bloc.dart';
import 'package:anakut_bank/src/features/setting/screen/Detail/payment_cate_detail.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CompanyCateBloc companyCateBloc = CompanyCateBloc();

class BillPaymentSettingDetail extends StatefulWidget {
  const BillPaymentSettingDetail({Key? key}) : super(key: key);

  @override
  State<BillPaymentSettingDetail> createState() =>
      _BillPaymentSettingDetailState();
}

class _BillPaymentSettingDetailState extends State<BillPaymentSettingDetail> {
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
      ),
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
                    onTap: () {
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
