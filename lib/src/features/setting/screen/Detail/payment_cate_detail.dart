import 'package:anakut_bank/src/features/exchnage/bloc/create_bloc/bloc/create_bloc.dart';
import 'package:anakut_bank/src/features/home/screen/menu.dart';
import 'package:anakut_bank/src/features/login/screen/dialog.dart';
import 'package:anakut_bank/src/features/payment/bloc/bloc/Cate_detail/bloc/cate_detail_bloc.dart';
import 'package:anakut_bank/src/features/payment/bloc/create_company/bloc/create_company_bloc.dart';
import 'package:anakut_bank/src/features/payment/model/cate_model.dart';
import 'package:anakut_bank/src/features/payment/screen/bill_payment.dart';
import 'package:anakut_bank/src/features/payment/screen/create_companyscreen.dart';
import 'package:anakut_bank/src/features/payment/screen/edit_company_screen.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CateDetailBloc cateDetailBloc = CateDetailBloc();
CreateCompanyBloc createCompanyBloc = CreateCompanyBloc();

class CateDetail extends StatefulWidget {
  List<CompanyCateModel> getCate;
  int index;
  CateDetail({required this.getCate, required this.index});

  @override
  State<CateDetail> createState() => _CateDetailState();
}

class _CateDetailState extends State<CateDetail> {
  var CURRENCY_CODES = ["Edit", "Delete"];
  String currency = "Nearby";
  var _popupMenuItemIndex = 0;
  Color _changeColorAccordingToMenuItem = Colors.red;
  String _selectedMenu = '';
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    cateDetailBloc.add(FetchCateDetailStarted(id: widget.index + 1));
    print(widget.index + 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.index + 1;
    print(id);
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
          "${widget.getCate[widget.index].category_name}",
          style: TextStyle(color: Colors.black, fontFamily: 'kh'),
        ),
      ),
      body: BlocConsumer(
        bloc: cateDetailBloc,
        listener: (context, state) {
          if (state is FetchedCateDetail) {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
          if (state is EndofCateDetail) {
            _refreshController.loadNoData();
          }
        },
        builder: (context, state) {
          if (state is FetchingCateDetail) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorCateDetail) {
            return Text("Error");
          }
          return BlocListener(
            bloc: cateDetailBloc,
            listener: (context, state) {
              if (state is Deleting) {
                loadingDialogs(context);
              } else if (state is ErrorDelete) {
                Navigator.pop(context);
              } else if (state is Deleted) {
                Navigator.pop(context);
                cateDetailBloc
                    .add(FetchCateDetailStarted(id: widget.index + 1));
              }
            },
            child: SmartRefresher(
              cacheExtent: 1,
              // cacheExtent: 500,
              physics: AlwaysScrollableScrollPhysics(),
              onRefresh: () {
                cateDetailBloc.add(FetchCateDetailStarted(id: id));
              },
              onLoading: () {
                if (state is EndofCateDetail) {
                } else {
                  cateDetailBloc.add(RefreshCate(id: id));
                }
              },
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cateDetailBloc.DetailList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        width: width * 0.9,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          )
                        ]),
                        child: Row(
                          children: [
                            Expanded(
                                child: ListTile(
                              leading: Container(
                                  width: 60,
                                  height: 60,
                                  child: cateDetailBloc
                                              .DetailList[index].company_logo ==
                                          "no_image.png"
                                      ? Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: white),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/no-photo.png"),
                                          ),
                                        )
                                      : Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: white),
                                          child: Image(
                                              image: NetworkImage(cateDetailBloc
                                                  .DetailList[index]
                                                  .company_logo)),
                                        )),
                              title: Text(
                                cateDetailBloc.DetailList[index].company_name,
                                style: TextStyle(fontFamily: 'kh'),
                              ),
                            )),
                            Container(
                              width: 60,
                              child: PopupMenuButton(
                                onSelected: (c) {
                                  if (c == "Edit") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditCompanyScreen(
                                                  getCate: widget.getCate,
                                                  index: widget.index,
                                                  com_id: cateDetailBloc
                                                      .DetailList[index]
                                                      .company_id,
                                                  company_name: cateDetailBloc
                                                      .DetailList[index]
                                                      .company_name,
                                                  image: cateDetailBloc
                                                      .DetailList[index]
                                                      .company_logo,
                                                  code: cateDetailBloc
                                                      .DetailList[index]
                                                      .company_code,
                                                )));
                                  } else {
                                    cateDetailBloc.add(DeletePress(
                                        id: cateDetailBloc
                                            .DetailList[index].company_id));
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    //Text(currency),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                                itemBuilder: (context) => CURRENCY_CODES
                                    .map((c) =>
                                        PopupMenuItem(value: c, child: Text(c)))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BillPaymentScreen(
                                      image: cateDetailBloc
                                          .DetailList[index].company_logo,
                                      name: widget
                                          .getCate[widget.index].category_name, catename: '',
                                    )));
                      },
                    );
                  }),
            ),
          );
        },
      ),
      floatingActionButton: InkWell(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Icon(
            Icons.add,
            size: 30,
            color: white,
          ),
        ),
        onTap: () {
          // createCompanyBloc.add(CreatePress(name: , logo: logo, id: id, code: code))

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateCompanyScreen(
                        cate: '${widget.getCate[widget.index].category_name}',
                        cateid: widget.index + 1,
                        his: widget.getCate,
                      )));
        },
      ),
    );
  }
}
