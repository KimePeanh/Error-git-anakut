import 'package:anakut_bank/src/features/account/model/account_model.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfile extends StatefulWidget {
  //const MyProfile({Key? key}) : super(key: key);
  final AccountModel accountModel;
  MyProfile({required this.accountModel});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
    // return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
    //   if (state is FetchingAccount) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    //   if (state is ErrorFetchAccount) {
    //     print("error");
    //   }
    //   return Container(
    //     padding: EdgeInsets.only(right: 100),
    //     height: 120,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Container(
    //           width: 70,
    //           height: 70,
    //           //padding: EdgeInsets.all(3),
    //           decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               border: Border.all(color: white, width: 2)),
    //           child: CircleAvatar(
    //               backgroundImage: AssetImage("assets/images/pf.jpg")),
    //         ),
    //         SizedBox(
    //           width: 10,
    //         ),
    //         Container(
    //           height: 70,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Container(
    //                   width: 100,
    //                   alignment: Alignment.centerLeft,
    //                   child: Text(
    //                    "${BlocProvider.of<AccountBloc>(context).accountModel!.name}" ,
    //                     style: TextStyle(
    //                         color: white,
    //                         fontSize: 18,
    //                         fontWeight: bold,
    //                         fontFamily: 'kh'),
    //                   )),
    //               Container(
    //                   width: 100,
    //                   alignment: Alignment.centerLeft,
    //                   child: Text(
    //                    "${BlocProvider.of<AccountBloc>(context).accountModel!.phone}" ,
    //                     style: TextStyle(color: white, fontFamily: 'kh'),
    //                   ))
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // });
    return Container(
      width: 70,
      height: 70,
      child: widget.accountModel.image_url != null?
      CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(widget.accountModel.image_url!),
      ): CircleAvatar(
         backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/newonecam-53e7c.appspot.com/o/user%20(1).png?alt=media&token=c4dafa52-3e22-4514-9482-874bd4dde42d'),
      )
    );
  }
}
