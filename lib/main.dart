import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swap_me/firebase_options.dart';
import 'package:swap_me/screens/Splash/splash.dart';
import 'package:swap_me/screens/Splash/splash_screen.dart';
import 'package:swap_me/screens/onBoard/on_board_screen.dart';
import 'package:swap_me/shared/network/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
