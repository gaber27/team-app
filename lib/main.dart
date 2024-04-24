import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:team/constant/colors.dart';
import 'package:team/controller/app/cubit.dart';
import 'package:team/view/pages/splash.dart';
import 'controller/user/cubit.dart';
import 'generated/l10n.dart';
import 'network/dio.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => UserCubit()..getUsers())
      ],

      // Here i used Sized package for responsive
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Players',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor:mainColor),
            useMaterial3: true,
          ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen()
        ),
      ),
    );
  }
}


/// HTTP Function To Use Internet In App
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext ? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
