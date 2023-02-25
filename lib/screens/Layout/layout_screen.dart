import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/screens/onBoard/on_board_screen.dart';
import 'package:swap_me/shared/components/navigator.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_cubit.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';
import 'package:swap_me/shared/network/cache_helper.dart';
import 'package:swap_me/shared/styles/theme.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);
  static const String routeName = 'LayoutScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SwapCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  logOut(context);
                },
                icon: SvgPicture.asset('assets/images/menu-left-alt.svg'),
              ),
            ],
            centerTitle: true,
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: GoogleFonts.cairo(
                color: ThemeApp.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset('assets/images/Group 281.svg'),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ThemeApp.primaryColor,
            shape: const StadiumBorder(
              side: BorderSide(color: Colors.white, width: 0),
            ),
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            elevation: 5,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.transparent,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: SvgPicture.asset(
                      'assets/images/Huge-icon-smart house-outline-home 2.svg'),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: SvgPicture.asset(
                      'assets/images/Huge-icon-device-outline-notification.svg'),
                  label: 'تنبيهاتى',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: SvgPicture.asset('assets/images/Group 296.svg'),
                  label: 'إعلاناتى',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: SvgPicture.asset(
                      'assets/images/Huge-icon-user-outline-user.svg'),
                  label: 'حسابى',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void logOut(context) {
    CacheHelper.removeData(
      key: 'uId',
    ).then((value) {
      if (value) {
        navigateAndFinish(context, routeName: OnBoardingScreen.routeName);
      }
    });
  }
}
