import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swap_me/model/ads_model.dart';
import 'package:swap_me/model/category_model.dart';
import 'package:swap_me/model/product_model.dart';
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

  void changeBottomNav(int index) {
    currentIndex = index;
    if (index == 0) {
      getCategoryData();
      getProductData(categoryMainModel?.cId);
      getProData();
      getMyAdsData(userModel?.uId);
    }
    if (index == 1) {}
    if (index == 2) {
      getMyAdsData(userModel?.uId);
    }
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

  getCategoryData() {
    FirebaseFirestore.instance.collection('categoryMain').get().then((value) {
      category = [];
      for (var element in value.docs) {
        category.add(CategoryMainModel.fromFireStore(element.data()));
        cId.add(element.id);
      }
    });
  }

  List<ProductModel> newProduct = [];

  List<String> proID = [];

  getDataPro() {
    FirebaseFirestore.instance.collectionGroup('product').get().then((value) {
      newProduct = [];
      for (var element in value.docs) {
        newProduct.add(ProductModel.fromFireStore(element.data()));
        proID.add(element.id);
      }
    });
  }

  List<ProductModel> productModel = [];

  List<String> pId = [];

  getProductData(String? cId) {
    FirebaseFirestore.instance
        .collection('categoryMain')
        .doc(cId)
        .collection('product')
        .get()
        .then((value) {
      productModel = [];
      for (var element in value.docs) {
        productModel.add(ProductModel.fromFireStore(element.data()));
        pId.add(element.id);
      }
    });
  }

  ProductModel? product;

  void getProData() {
    emit(GetProDataLoadingState());
    FirebaseFirestore.instance
        .collection('categoryMain')
        .doc('1.Colthes')
        .collection('product')
        .doc('1.Men clothes')
        .get()
        .then((value) {
      product = ProductModel.fromFireStore(value.data()!);
      emit(GetProDataSuccessState());
      if (kDebugMode) {
        print(value.data());
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetProDataErrorState(error.toString()));
    });
  }

  CategoryMainModel? categoryMainModel;

  void getData(String? cId) {
    emit(GetDataLoadingState());
    FirebaseFirestore.instance
        .collection('categoryMain')
        .doc(cId)
        .get()
        .then((value) {
      categoryMainModel = CategoryMainModel.fromFireStore(value.data()!);
      emit(GetDataSuccessState());
      if (kDebugMode) {
        print(value.data());
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetDataErrorState(error.toString()));
    });
  }

  List<AdsModel> ads = [];
  List<String> iD = [];

  getAdsData() async {
    FirebaseFirestore.instance.collection('ADS').get().then((value) {
      ads = [];
      for (var element in value.docs) {
        ads.add(AdsModel.fromFireStore(element.data()));
        iD.add(element.id);
      }
    });
  }

  List<AdsModel> adsNewModel = [];
  List<String> id = [];

  getADSData(String? pID) async {
    FirebaseFirestore.instance
        .collection('ADS')
        .where('productName', isEqualTo: pID)
        .get()
        .then((value) {
      adsNewModel = [];
      for (var element in value.docs) {
        adsNewModel.add(AdsModel.fromFireStore(element.data()));
        id.add(element.id);
      }
    });
  }

  List<AdsModel> userAds = [];

  getMyAdsData(String? userID) async {
    FirebaseFirestore.instance.collection('ADS').get().then((value) {
      userAds = [];
      for (var element in value.docs) {
        if (element.data()['iD'] == userID) {
          userAds.add(AdsModel.fromFireStore(element.data()));
        }
      }
    });
  }

  var picker = ImagePicker();
  File? adsImagePicked;

  Future<void> getAdsImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      adsImagePicked = File(pickedFile.path);
      emit(GetAdsImagePickedSuccessState());
    } else {
      debugPrint('No image selected');
      emit(GetAdsImagePickedErrorState());
    }
  }

  AdsModel? adsModel;

  void getADsData() {
    emit(GetProductDataLoadingState());
    FirebaseFirestore.instance
        .collection('ADS')
        .doc('kBVi65DB1EfFAYCuADgu')
        .get()
        .then((value) {
      adsModel = AdsModel.fromFireStore(value.data()!);
      emit(GetProductDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetProductDataErrorState(error.toString()));
    });
  }

  void uploadAdsImage({
    required String name,
    String? image,
    String? iD,
    required String desc,
    required dynamic categoryName,
    required dynamic productName,
    required String dateTime,
  }) {
    emit(CreateAdsLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('adsImage/${Uri.file(adsImagePicked!.path).pathSegments.last}')
        .putFile(adsImagePicked!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createAds(
          iD: userModel!.uId,
          name: name,
          image: value,
          desc: desc,
          categoryName: categoryName,
          productName: productName,
          dateTime: dateTime,
        );

        emit(CreateAdsSuccessState());
      }).catchError((error) {
        emit(CreateAdsErrorState());
      });
    }).catchError((error) {
      emit(CreateAdsErrorState());
    });
  }

  void createAds({
    required String name,
    String? image,
    String? iD,
    required String desc,
    required String categoryName,
    required String productName,
    required String dateTime,
  }) {
    emit(CreateAdsLoadingState());

    AdsModel model = AdsModel(
      iD: userModel!.uId,
      image: image ?? "",
      name: name,
      desc: desc,
      categoryName: categoryName,
      productName: productName,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection('ADS')
        .add(model.toFireStore())
        .then((value) {
      emit(CreateAdsSuccessState());
    }).catchError((error) {
      emit(CreateAdsErrorState());
    });
  }

  void removePostImage() {
    adsImagePicked = null;

    emit(RemoveAdsImageSuccessState());
  }
}
