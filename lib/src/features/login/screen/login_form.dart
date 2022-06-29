// import 'package:anakut_bank/app_localiztion.dart';
// import 'package:anakut_bank/src/features/Auth/bloc/bloc/auth_bloc.dart';
// import 'package:anakut_bank/src/features/home/screen/homeScreen.dart';
// import 'package:anakut_bank/src/features/login/bloc/bloc/index.dart';
// import 'package:anakut_bank/src/features/login/screen/dialog.dart';
// import 'package:anakut_bank/src/features/login/screen/googleSign.dart';
// import 'package:anakut_bank/src/shared/widgets/errorSnackbar.dart';
// import 'package:anakut_bank/src/shared/widgets/widget.dart';
// import 'package:anakut_bank/src/utils/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Loginform extends StatefulWidget {
//   const Loginform({Key? key}) : super(key: key);

//   @override
//   _LoginformState createState() => _LoginformState();
// }

// class _LoginformState extends State<Loginform> {
//   late TextEditingController? _emailController = TextEditingController();
//   late TextEditingController? _passwordController = TextEditingController();
//   late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, dynamic state) {
//         if (state is Logging) {
//           loadingDialogs(context);
//         } else if (state is Logged) {
//           print("hiiiiiiiiiiiiiiiiiiiii");
//           if (state.userModel.verifyStatus == "completed") {
//             print("Seeseeeeee");
//             print(state.userModel.token);
//             BlocProvider.of<AuthBloc>(context)
//                 .add(AuthenticationStarted(token: state.userModel.token, ver: state.userModel.verifyStatus!));
//             Navigator.of(context).pop();
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (context) => HomeScreen('')));
//           }
//         } else if (state is Googlelog) {
//           print(state.loginResponModel.token);
//           BlocProvider.of<AuthBloc>(context)
//               .add(AuthenticationStarted(token: state.loginResponModel.token, ver: state.loginResponModel.staus));
//           Navigator.of(context).pop();
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => HomeScreen('')));
//         } else if (state is ErrorLogin) {
//           print("hiiiiKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
//           Navigator.of(context).pop();
//           errorSnackBar(text: state.error, context: context);
//         }
//       },
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(left: 25, right: 25),
//               child: TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: AppLocalizations.of(context)!.translate("email")!,
//                   labelStyle: TextStyle(fontFamily: 'kh'),
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.grey),
//                     gapPadding: 10,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.grey),
//                     gapPadding: 10,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return AppLocalizations.of(context)!.translate("phReq");
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 25, right: 25),
//               child: TextFormField(
//                 controller: _passwordController,
//                 keyboardType: TextInputType.visiblePassword,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   isDense: true,
//                   labelText: AppLocalizations.of(context)!.translate("pass")!,
//                   labelStyle: TextStyle(fontFamily: 'kh'),
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.grey),
//                     gapPadding: 5,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return AppLocalizations.of(context)!
//                         .translate("passRequired");
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width - 50,
//               child: Text(
//                 AppLocalizations.of(context)!.translate('forgetpass')!,
//                 style: TextStyle(fontFamily: 'kh', color: grey),
//                 textAlign: TextAlign.end,
//               ),
//             ),
//             SizedBox(
//               height: 60,
//             ),
//             InkWell(
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 height: 50,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(mainRadius),
//                     color: mainColor,
//                     boxShadow: [
//                       BoxShadow(
//                         color: grey,
//                         offset: Offset(1, 1),
//                       )
//                     ]),
//                 child: Text(
//                   AppLocalizations.of(context)!.translate("login")!,
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: white,
//                       fontFamily: 'kh'),
//                 ),
//               ),
//               onTap: () {
//                 if (_formKey!.currentState!.validate()) {
//                   BlocProvider.of<LoginBloc>(context).add(LoginPressed(
//                       phoneNumber: _emailController!.text,
//                       password: _passwordController!.text));
//                 }
//               },
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   height: 1.5,
//                   color: grey,
//                 ),
//                 SizedBox(
//                   width: 4,
//                 ),
//                 Text("Signin with"),
//                 SizedBox(
//                   width: 4,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   height: 1.5,
//                   color: grey,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   child: BTGoogle(),
//                   onTap: () {
//                     Signin();
//                   },
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   child: BTfacebook(),
//                   onTap: () {
//                     singout();
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future Signin() async {
//     final user = login();

//     //print(user!.displayName.toString());
//     //print(user.serverAuthCode!.codeUnits.toString());
//     // print(user.photoUrl.toString());
//     // print(user.authHeaders..toString());
//   }

//   Future singout() async {
//     await GoogleSignInApi.logout();
//   }

//   final _googlesignin = GoogleSignIn();
//   Future<GoogleSignInAccount?> login() => _googlesignin.signIn().then((result) {
//         result!.authentication.then((googleKey) {
//           print(googleKey.accessToken);
//           BlocProvider.of<LoginBloc>(context)
//               .add(GoogleloginPress(token: googleKey.accessToken!.toString()));
//           // loginBloc
//           //     .add(GoogleloginPress(token: googleKey.accessToken!.toString()));
//           print(googleKey.idToken);
//           print(_googlesignin.currentUser!.displayName);
//         }).catchError((err) {
//           print('inner error');
//         });
//       }).catchError((err) {
//         print('error occured');
//       });
// }
