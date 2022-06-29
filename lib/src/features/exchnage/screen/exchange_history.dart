import 'package:anakut_bank/src/features/exchnage/bloc/bloc/bloc/history_exchange_bloc.dart';
import 'package:anakut_bank/src/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class His extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            HistoryExchangeBloc(Helper: RepositoryProvider.of<helper>(context))
              ..add(InitializeExpenseList(dateRange: "Today")),
        child: ExpenseBody());
  }
}

class ExpenseBody extends StatelessWidget {
 
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
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
          "History",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocListener<HistoryExchangeBloc, HistoryExchangeState>(     
        listener: (context, state) {
          if (state is InitializedExpenseList) {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
          if (state is EndOfExpenseList) {
            _refreshController.loadNoData();
          }
        },
        child: Text("Hi"),
        // builder: (con, state) {
         
          
        // },
      ),
    );
  }
}
