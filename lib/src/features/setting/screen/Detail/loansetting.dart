import 'package:anakut_bank/src/features/setting/blog/setting/bloc/loan_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

LoanBloc loanBloc = LoanBloc();

class LoanSetting extends StatefulWidget {
  const LoanSetting({Key? key}) : super(key: key);

  @override
  State<LoanSetting> createState() => _LoanSettingState();
}

class _LoanSettingState extends State<LoanSetting> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    loanBloc.add(GetItemStarted());
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
            "Loan Setting",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocConsumer(
          bloc: loanBloc,
          listener: (context, state) {
            if (state is Getteditem) {
              _refreshController.loadComplete();
              _refreshController.refreshCompleted();
            }
            if (state is End) {
              _refreshController.loadNoData();
            }
          },
          builder: (context, state) {
            if (state is Gettingitem) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorGet) {
              return Container();
            }
            return SmartRefresher(
              controller: _refreshController,
              cacheExtent: 1,
              physics: AlwaysScrollableScrollPhysics(),
              onRefresh: () {
                loanBloc.add(GetItemStarted());
              },
              onLoading: () {
                if (state is End) {
                } else {
                  loanBloc.add(Reload());
                }
              },
              enablePullDown: true,
              enablePullUp: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: loanBloc.item_list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        )
                      ]),
                      child: ListTile(
                        title: Text(loanBloc.item_list[index].name),
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
