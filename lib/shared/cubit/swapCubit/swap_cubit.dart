import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_me/model/user_model.dart';
import 'package:swap_me/shared/constants/constants.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';


class SwapCubit extends Cubit<SwapStates> {
  SwapCubit() : super(SwapInitialState());

  static SwapCubit get(context) => BlocProvider.of(context);

  ///START : ChangeBottomNavBar
  int currentIndex = 0;
  List<Widget> screens = [

  ];
  List<String> titles = [
    'Explore',
    'Wishlist',
    'My Plans',
    'Profile',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      getUserData();

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
}