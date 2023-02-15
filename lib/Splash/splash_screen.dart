import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:swap_me/Splash/splash.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = "initial";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 200,
        backgroundColor: const Color.fromARGB(255, 0, 74, 134),
        pageTransitionType: PageTransitionType.rightToLeft,
        splashTransition: SplashTransition.rotationTransition,
        splash: Image.asset("assets/images/logo.png"),
        nextScreen: const NewScreen(),
        duration: 2000,
        animationDuration: const Duration(seconds: 2));

  }
}