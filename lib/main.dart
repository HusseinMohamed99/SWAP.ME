import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:swap_me/firebase_options.dart';
import 'package:swap_me/screens/SignIn/sign_in_screen.dart';
import 'package:swap_me/screens/SignUp/sign_up_screen.dart';
import 'package:swap_me/screens/Splash/splash.dart';
import 'package:swap_me/screens/Splash/splash_screen.dart';
import 'package:swap_me/screens/onBoard/boarding_screen.dart';
import 'package:swap_me/screens/onBoard/on_board_screen.dart';
import 'package:swap_me/shared/network/cache_helper.dart';
import 'package:swap_me/shared/styles/theme.dart';

void main() async {
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
      themeMode: ThemeMode.light,
      theme: ThemeApp.lightTheme,
      locale: const Locale('en'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // Arabic
        Locale('en', ''), // English
      ],
      routes: {
        OnBoardingScreen.routeName: (_) => const OnBoardingScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        NewScreen.routeName: (_) => const NewScreen(),
        BoardingScreen.routeName: (_) => const BoardingScreen(),
        SignInScreen.routeName: (_) => const SignInScreen(),
        SignUpScreen.routeName: (_) => const SignUpScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
