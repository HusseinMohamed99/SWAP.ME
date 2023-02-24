import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_me/model/category_model.dart';
import 'package:swap_me/screens/onBoard/on_board_screen.dart';
import 'package:swap_me/shared/components/navigator.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_cubit.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';
import 'package:swap_me/shared/network/cache_helper.dart';
import 'package:swap_me/shared/styles/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SwapCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return buildCategoryItem(context, cubit.category[index]);
                },
                separatorBuilder: (context, _) {
                  return const DSize(height: 20, width: 0);
                },
                itemCount: cubit.category.length,
              ),
            ),
          ],
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

  Widget buildCategoryItem(BuildContext context, CategoryMainModel model) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 249, 201, 124),
              radius: 40,
              child: Image.asset('assets/images/Group 171.png'),
            ),
            Text(
              model.name,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: ThemeApp.primaryColor,
                  ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
