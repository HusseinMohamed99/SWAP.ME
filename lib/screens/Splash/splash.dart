import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swap_me/screens/Layout/layout_screen.dart';
import 'package:swap_me/screens/onBoard/on_board_screen.dart';
import 'package:swap_me/shared/constants/constants.dart';
import 'package:swap_me/shared/network/cache_helper.dart';

class NewScreen extends StatefulWidget {
  static const routeName = "NewScreen";

  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      uId = CacheHelper.getData(key: 'uId');
      if (uId != null) {
        Navigator.of(context).pushReplacementNamed(
          LayoutScreen.routeName,
        );
      } else {
        Navigator.of(context).pushReplacementNamed(
          OnBoardingScreen.routeName,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: const Color.fromARGB(255, 0, 74, 134),
      body: Center(
        child: Image.asset("assets/images/Group 377.png"),
      ),
    );
  }
}
