import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import 'package:page_transition/page_transition.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), ()
    {
      // After 3s the splash page removed and navigate to home screen
      Navigator.pushAndRemoveUntil(context, PageTransition(child: const HomePage(), type: PageTransitionType.leftToRight),(route) => false,);
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          color: mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(Images.splashAnimation),
            ],
          ),
        )

    );
  }
}