import 'package:anakut_bank/src/features/setting/blog/setting/bloc/currency_bloc/bloc/currency_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

CurrencyBloc currencyBloc = CurrencyBloc();

class CurrencyDetail extends StatefulWidget {
  const CurrencyDetail({Key? key}) : super(key: key);

  @override
  State<CurrencyDetail> createState() => _CurrencyDetailState();
}

class _CurrencyDetailState extends State<CurrencyDetail> {
  @override
  Widget build(BuildContext context) {
    currencyBloc.add(FetchCurrencyStarted());
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
          "Currency",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder(
        bloc: currencyBloc,
        builder: (context, state) {
          if (state is FetchingCurrency) {
            return Center(
              child: Container(
                  width: 100,
                  child: LottieBuilder.asset(
                      "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
            );
          } else if (state is ErrorFetchingCurrency) {
            return Text(state.e.toString());
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: currencyBloc.getCurrency.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      right: MediaQuery.of(context).size.width * 0.02,
                      bottom: 10),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 2),
                            blurRadius: 1)
                      ]),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          NetworkImage(currencyBloc.getCurrency[index].image!),
                    ),
                    title: Text(currencyBloc.getCurrency[index].name!),
                    subtitle: Text(currencyBloc.getCurrency[index].symbol!),
                    trailing: Icon(Icons.more_vert),
                  ),
                );
              });
        },
      ),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff029E24),
        ),
        child: Icon(
          Icons.add,
          color: white,
          size: 30,
        ),
      ),
    );
  }
}
