import 'package:anakut_bank/app_localiztion.dart';
import 'package:anakut_bank/src/features/Auth/bloc/bloc/auth_bloc.dart';
import 'package:anakut_bank/src/features/account/bloc/bloc/account_bloc.dart';
import 'package:anakut_bank/src/features/account/bloc/pinbloc/bloc/resetpin_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/bloc/bloc/history_exchange_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/bloc/exchange_bloc.dart';
import 'package:anakut_bank/src/features/exchnage/bloc/create_bloc/bloc/create_bloc.dart';
import 'package:anakut_bank/src/features/home/bloc/bloc/getshop_bloc.dart';
import 'package:anakut_bank/src/features/home/bloc/search/bloc/search_bloc.dart';
import 'package:anakut_bank/src/features/language/bloc/bloc/language_bloc.dart';
import 'package:anakut_bank/src/features/language/bloc/bloc/language_event.dart';
import 'package:anakut_bank/src/features/language/bloc/bloc/language_state.dart';
import 'package:anakut_bank/src/features/login/bloc/bloc/index.dart';
import 'package:anakut_bank/src/features/notification/bloc/bloc/notification_bloc.dart';
import 'package:anakut_bank/src/features/otp/bloc/bloc/resendotp_bloc.dart';
import 'package:anakut_bank/src/features/pin/bloc/bloc/setpin_bloc.dart';
import 'package:anakut_bank/src/features/reciept/bloc/bloc/reciept_bloc.dart';
import 'package:anakut_bank/src/features/reciept/setting/bloc/index.dart';
import 'package:anakut_bank/src/features/setting/blog/setting/bloc/counter_bloc/bloc/counter_bloc.dart';
import 'package:anakut_bank/src/features/splash/screen/splash.dart';
import 'package:anakut_bank/src/features/transfer/bloc/bloc/transfer_bloc.dart';
import 'package:anakut_bank/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
  systemOverlayStyle:
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: mainColor,
    statusBarBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (BuildContext context) =>
                  AuthBloc()..add(CheckingAuthenticationStarted())),
          BlocProvider<LanguageBloc>(
              create: (BuildContext context) =>
                  LanguageBloc()..add(LanguageLoadStarted())),
          BlocProvider<LoginBloc>(
              create: (BuildContext context) => LoginBloc()),
          BlocProvider<GetshopBloc>(
              create: (BuildContext context) => GetshopBloc()),
          BlocProvider<AccountBloc>(
              create: (BuildContext context) =>
                  AccountBloc()..add(FetchAccountStarted())),
          BlocProvider<NotificationBloc>(
              create: (BuildContext context) => NotificationBloc()),
          BlocProvider<SearchBloc>(
              create: (BuildContext context) => SearchBloc()),
          BlocProvider<ExchangeBloc>(
              create: (BuildContext context) => ExchangeBloc()),
          BlocProvider<ResetpinBloc>(
              create: (BuildContext context) => ResetpinBloc()),
          BlocProvider<ResendotpBloc>(create: (context) => ResendotpBloc()),
          BlocProvider<SetpinBloc>(create: (context) => SetpinBloc()),
          BlocProvider<TransferBloc>(create: (context) => TransferBloc()),
          BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
          BlocProvider<CreateBloc>(create: (context) => CreateBloc()),
          BlocProvider<RecieptBloc>(create: (context) => RecieptBloc()),
          BlocProvider<SettingBloc>(create: (context) => SettingBloc()),
          // BlocProvider<HistoryExchangeBloc>(
          //     create: (context) => HistoryExchangeBloc(
          //         Helper: RepositoryProvider.of<helper>(context))),
         BlocProvider<HistoryExchangeBloc>(create: (context) => HistoryExchangeBloc()),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: state.locale,
              // onGenerateRoute: RouteGenerator.generateRoute,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate,
              ],      
              supportedLocales: [Locale('en', 'US'), Locale('km', 'KH')],
              title: 'Anakut Bank',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: SplashScreen(),
            );
          },
        ));
  }
}
