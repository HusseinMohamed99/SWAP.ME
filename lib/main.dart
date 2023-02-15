import 'package:flutter/material.dart';
import 'package:swap_me/Cache_helper/cache_helper.dart';
import 'package:swap_me/Splash/splash.dart';
import 'package:swap_me/Splash/splash_screen.dart';
import 'package:swap_me/onBoard/on_board_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        OnBoardingScreen.routeName : (_)=> const OnBoardingScreen(),
        SplashScreen.routeName : (_)=> const SplashScreen(),
        NewScreen.routeName : (_)=> const NewScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
