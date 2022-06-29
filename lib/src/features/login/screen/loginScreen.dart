// import 'package:anakut_bank/app_localiztion.dart';
// import 'package:anakut_bank/src/features/login/screen/googleSign.dart';
// import 'package:anakut_bank/src/features/register/screen/registerScreen.dart';
// import 'package:anakut_bank/src/shared/widgets/widget.dart';
// import 'package:anakut_bank/src/utils/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'login_form.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//       body: CustomScrollView(
//         slivers: [
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                   SafeArea(
//                     child: Container(
//                       padding: EdgeInsets.only(top: 20),
//                       width: 150,
//                       height: 150,
//                       //height: 150,
//                       child: Image(
//                           width: 150,
//                           height: 150,
//                           image: AssetImage('assets/images/logobank.png')),
//                     ),
//                   ),
//                   Container(
//                     width: 295,
//                     child: Text(
//                       AppLocalizations.of(context)!.translate('welcome')!,
//                       style: TextStyle(
//                           fontSize: 19,
//                           fontWeight: FontWeight.bold,
//                           color: csblack,
//                           fontFamily: 'kh'),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width - 50,
//                     child: Text(
//                       AppLocalizations.of(context)!.translate('signin to con')!,
//                       style: TextStyle(
//                           fontSize: 16, color: grey, fontFamily: 'kh'),
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Loginform(),
                  
//                   //Spacer(),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.only(bottom: 20),
//         width: MediaQuery.of(context).size.width,
//         // margin: EdgeInsets.only(left: 30),
//         child: InkWell(
//           child: Text(
//             AppLocalizations.of(context)!.translate("create account")!,
//             style: TextStyle(
//                 color: grey, fontWeight: FontWeight.bold, fontFamily: 'kh'),
//             textAlign: TextAlign.center,
//             textScaleFactor: 1,
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => RegisterScreen()));
//           },
//         ),
//       ),
//       // floatingActionButton: Container(
//       //   width: MediaQuery.of(context).size.width,
//       //   margin: EdgeInsets.only(left: 30),
//       //   child: InkWell(
//       //     child: Text(
//       //       AppLocalizations.of(context)!.translate("create account")!,
//       //       style: TextStyle(
//       //           color: grey, fontWeight: FontWeight.bold, fontFamily: 'kh'),
//       //       textAlign: TextAlign.center,
//       //     ),
//       //     onTap: () {
//       //       Navigator.push(context,
//       //           MaterialPageRoute(builder: (context) => RegisterScreen()));
//       //     },
//       //   ),
//       // ),
//     );
//   }



// }
