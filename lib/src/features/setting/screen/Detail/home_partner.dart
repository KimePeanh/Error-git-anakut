import 'package:anakut_bank/src/features/transfer/bloc/bloc/transfer_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomePartner extends StatefulWidget {
  const HomePartner({Key? key}) : super(key: key);

  @override
  State<HomePartner> createState() => _HomePartnerState();
}

class _HomePartnerState extends State<HomePartner> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TransferBloc>(context).add(StartedFetchTra());
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
          "Home Partner",
          style: TextStyle(color: Colors.black),
        ),
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
      body: BlocBuilder<TransferBloc, TransferState>(builder: (context, state) {
        if (state is FetchingTra) {
          return Center(
            child: Container(
                width: 100,
                child: LottieBuilder.asset(
                    "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
          );
        } else if (state is ErrorTra) {
          return Text(state.error.toString());
        }
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        BlocProvider.of<TransferBloc>(context).namee.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.9,
                        //height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(color: white,
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  BlocProvider.of<TransferBloc>(context)
                                      .namee[index]
                                      .image!)),
                          title: Text(BlocProvider.of<TransferBloc>(context)
                              .namee[index]
                              .home_name!),
                          subtitle: Text(BlocProvider.of<TransferBloc>(context)
                              .namee[index]
                              .address!),
                          trailing: Icon(Icons.more_vert),
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
