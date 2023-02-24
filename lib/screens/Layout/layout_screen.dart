import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_cubit.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';
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
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.barsStaggered,
                    color: ThemeApp.primaryColor,
                  )),
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
              child: Image.asset('assets/images/Group 281.png'),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ThemeApp.primaryColor,
            shape: const StadiumBorder(
                side: BorderSide(color: Colors.white, width: 0)),
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomAppBar(
            color: ThemeApp.backgroundColor,
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
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    FontAwesomeIcons.houseUser,
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    FontAwesomeIcons.bell,
                  ),
                  label: 'تنبيهاتى',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    FontAwesomeIcons.newspaper,
                  ),
                  label: 'إعلاناتى',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    FontAwesomeIcons.user,
                  ),
                  label: 'حسابى',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
