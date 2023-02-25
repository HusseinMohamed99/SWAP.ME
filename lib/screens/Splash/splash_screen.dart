import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swap_me/screens/Splash/splash.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = "initial";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 74, 134),
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 0, 74, 134),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: AnimatedSplashScreen(
        splashIconSize: 200,
        backgroundColor: const Color.fromARGB(255, 0, 74, 134),
        pageTransitionType: PageTransitionType.rightToLeft,
        splashTransition: SplashTransition.scaleTransition,
        splash: Image.asset("assets/images/logo.png"),
        nextScreen: const NewScreen(),
        duration: 2000,
        animationDuration: const Duration(seconds: 2),
      ),
    );
  }
}