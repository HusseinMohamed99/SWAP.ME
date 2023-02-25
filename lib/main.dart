import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:swap_me/firebase_options.dart';
import 'package:swap_me/screens/EmailVerify/email_verify.dart';
import 'package:swap_me/screens/HomeScreen/home_screen.dart';
import 'package:swap_me/screens/Layout/layout_screen.dart';
import 'package:swap_me/screens/MyAds/my_ads.dart';
import 'package:swap_me/screens/Notifications/notifications_screen.dart';
import 'package:swap_me/screens/Password/forgot_password.dart';
import 'package:swap_me/screens/Profile/profile_screen.dart';
import 'package:swap_me/screens/SignIn/sign_in_screen.dart';
import 'package:swap_me/screens/SignUp/sign_up_screen.dart';
import 'package:swap_me/screens/Splash/splash.dart';
import 'package:swap_me/screens/Splash/splash_screen.dart';
import 'package:swap_me/screens/onBoard/boarding_screen.dart';
import 'package:swap_me/screens/onBoard/on_board_screen.dart';
import 'package:swap_me/shared/bloc_observer.dart';
import 'package:swap_me/shared/constants/constants.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_cubit.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';
import 'package:swap_me/shared/network/cache_helper.dart';
import 'package:swap_me/shared/styles/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');
  if (kDebugMode) {
    print('User ID = $uId');
  }
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwapCubit()
            ..getUserData()
            ..getCategoryData(),
        ),
      ],
      child: BlocConsumer<SwapCubit, SwapStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeApp.lightTheme,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('ar'),
            routes: {
              OnBoardingScreen.routeName: (_) => const OnBoardingScreen(),
              SplashScreen.routeName: (_) => const SplashScreen(),
              NewScreen.routeName: (_) => const NewScreen(),
              BoardingScreen.routeName: (_) => const BoardingScreen(),
              SignInScreen.routeName: (_) => const SignInScreen(),
              SignUpScreen.routeName: (_) => const SignUpScreen(),
              ForgotPassword.routeName: (_) => const ForgotPassword(),
              EmailVerify.routeName: (_) => const EmailVerify(),
              HomeScreen.routeName: (_) => const HomeScreen(),
              LayoutScreen.routeName: (_) => const LayoutScreen(),
              NotificationScreen.routeName: (_) => const NotificationScreen(),
              MyAdsScreen.routeName: (_) => const MyAdsScreen(),
              MyProfileScreen.routeName: (_) => const MyProfileScreen(),
            },
            initialRoute: SplashScreen.routeName,
          );
        },
      ),
    );
  }
}
