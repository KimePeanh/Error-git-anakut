// import 'package:anakut_bank/src/features/exchnage/bloc/bloc/exchange_bloc.dart';
// import 'package:anakut_bank/src/utils/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

// import 'exchange_rate.dart';

// class ExchangeRateShow extends StatefulWidget {
//   const ExchangeRateShow({Key? key}) : super(key: key);

//   @override
//   State<ExchangeRateShow> createState() => _ExchangeRateShowState();
// }

// class _ExchangeRateShowState extends State<ExchangeRateShow> {
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<ExchangeBloc>(context).add(FetchExchangeStarted());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.dark,
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             )),
//         title: Text(
//           "Exchange Rate",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: BlocBuilder<ExchangeBloc, ExchangeState>(builder: (context, state) {
//         if (state is FetchingExchnage) {
//           return Center(
//             child: Container(
//                 width: 150,
//                 child: LottieBuilder.asset(
//                     "assets/images/Bank/lf30_editor_bmeqpdqv.json")),
//           );
//         } else if (state is ErrorFetching) {
//           return Text(state.error.toString());
//         }
//         return ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: BlocProvider.of<ExchangeBloc>(context).rate.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   InkWell(
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       height: 50,
//                       decoration: BoxDecoration(
//                           color: white,
//                           borderRadius: BorderRadius.circular(5),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey.shade200,
//                                 offset: Offset(2, 2),
//                                 blurRadius: 1)
//                           ]),
//                       child: Row(
//                         children: <Widget>[
//                           Expanded(
//                               child: Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               BlocProvider.of<ExchangeBloc>(context)
//                                   .rate[index]
//                                   .name!,
//                               style:
//                                   TextStyle(fontFamily: 'kh', fontWeight: bold),
//                               textScaleFactor: 1.2,
//                             ),
//                           )),
//                           Container(
//                               width: 30,
//                               height: 30,
//                               child: Image(
//                                   image: AssetImage(
//                                       "assets/images/Bank/exchange (4).png"))),
//                           Expanded(
//                               child: Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               BlocProvider.of<ExchangeBloc>(context)
//                                   .rate[index]
//                                   .to_name!,
//                               style:
//                                   TextStyle(fontFamily: 'kh', fontWeight: bold),
//                               textScaleFactor: 1.2,
//                             ),
//                           )),
//                           Expanded(
//                               child: Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               double.parse(
//                                       BlocProvider.of<ExchangeBloc>(context)
//                                           .rate[index]
//                                           .rate_in!)
//                                   .toStringAsFixed(2),
//                               style: TextStyle(
//                                   fontFamily: 'kh',
//                                   fontWeight: bold,
//                                   color: Colors.green),
//                               textScaleFactor: 1.2,
//                             ),
//                           )),
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ExchangeRate(
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .name!,
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .to_name!,
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .rate_in!,
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .rate_out!)));
//                     },
//                   ),
//                   InkWell(
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       height: 50,
//                       decoration: BoxDecoration(
//                           color: white,
//                           borderRadius: BorderRadius.circular(5),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey.shade200,
//                                 offset: Offset(2, 2),
//                                 blurRadius: 1)
//                           ]),
//                       child: Row(
//                         children: <Widget>[
//                           Expanded(
//                               child: Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               BlocProvider.of<ExchangeBloc>(context)
//                                   .rate[index]
//                                   .to_name!,
//                               style:
//                                   TextStyle(fontFamily: 'kh', fontWeight: bold),
//                               textScaleFactor: 1.2,
//                             ),
//                           )),
//                           Container(
//                               width: 30,
//                               height: 30,
//                               child: Image(
//                                   image: AssetImage(
//                                       "assets/images/Bank/exchange (4).png"))),
//                           Expanded(
//                               child: Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               BlocProvider.of<ExchangeBloc>(context)
//                                   .rate[index]
//                                   .name!,
//                               style:
//                                   TextStyle(fontFamily: 'kh', fontWeight: bold),
//                               textScaleFactor: 1.2,
//                             ),
//                           )),
//                           Expanded(
//                               child: Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               double.parse(
//                                       BlocProvider.of<ExchangeBloc>(context)
//                                           .rate[index]
//                                           .rate_out!)
//                                   .toStringAsFixed(2),
//                               style: TextStyle(
//                                   fontFamily: 'kh',
//                                   fontWeight: bold,
//                                   color: Colors.green),
//                               textScaleFactor: 1.2,
//                             ),
//                           )),
//                         ],
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ExchangeRate(
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .name!,
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .to_name!,
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .rate_in!,
//                                   BlocProvider.of<ExchangeBloc>(context)
//                                       .rate[index]
//                                       .rate_out!)));
//                     },
//                   ),
//                 ],
//               );
//             });
//       }),
//       floatingActionButton: InkWell(
//         child: Container(
//           width: 65,
//           height: 65,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xff029E24),
//           ),
//           child: Icon(
//             Icons.add,
//             color: white,
//             size: 30,
//           ),
//         ),
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ExchangeRate('', '', '', '')));
//         },
//       ),
//     );
//   }
// }
