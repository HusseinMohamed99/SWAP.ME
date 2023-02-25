import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_me/model/category_model.dart';
import 'package:swap_me/model/user_model.dart';
import 'package:swap_me/screens/HomeScreen/home_screen.dart';
import 'package:swap_me/screens/MyAds/my_ads.dart';
import 'package:swap_me/screens/Notifications/notifications_screen.dart';
import 'package:swap_me/screens/Profile/profile_screen.dart';
import 'package:swap_me/shared/constants/constants.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';

class SwapCubit extends Cubit<SwapStates> {
  SwapCubit() : super(SwapInitialState());

  static SwapCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const MyAdsScreen(),
    const MyProfileScreen(),
  ];

  List<String> titles = [
    'الأقسام',
    'تنبهاتى',
    'إعلاناتى',
    'حسابى',
  ];

  //---------------------  Change Bottom Navigation Bar IN Home_Screen  --------------------------------//
  void changeBottomNav(int index) {
    currentIndex = index;
    if (index == 0) {
      getCategoryData();
    }
    if (index == 1) {}
    if (index == 2) {}
    if (index == 3) {}

    emit(ChangeBottomNavBarState());
  }

  UserModel? userModel;

  void getUserData() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromFireStore(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserDataErrorState(error.toString()));
    });
  }

  ///START : Show Password
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void showPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShowPasswordState());
  }

  List<CategoryMainModel> category = [];

  List<String> cId = [];

  getCategoryData() async {
    FirebaseFirestore.instance.collection('categoryMain').get().then((value) {
      category = [];
      for (var element in value.docs) {
        category.add(CategoryMainModel.fromFireStore(element.data()));
        cId.add(element.id);
        if (kDebugMode) {
          print(element.data());
        }
        if (kDebugMode) {
          print('====================================');
        }
      }
    });
  }
}