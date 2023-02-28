import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/model/arg_model.dart';
import 'package:swap_me/model/category_model.dart';
import 'package:swap_me/model/product_model.dart';
import 'package:swap_me/screens/Ads/add_ads.dart';
import 'package:swap_me/screens/Ads/ads_screen.dart';
import 'package:swap_me/shared/components/buttons.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_cubit.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';
import 'package:swap_me/shared/styles/theme.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = 'ProductScreen';

  @override
  Widget build(BuildContext context) {
    ScreenArgs screenArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: ThemeApp.primaryColor,
                ),
              ),
            ],
            title: Text(
              screenArgs.categoryMainModel.name,
              style: GoogleFonts.cairo(
                color: ThemeApp.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                NewList(
                    categoryMainModel: screenArgs.categoryMainModel,
                    productModel: screenArgs.productModel),
                defaultButton(
                  function: () {
                    SwapCubit.get(context).getProData();
                    SwapCubit.get(context).getDataPro();
                    Navigator.pushNamed(context, AddAds.routeName);
                  },
                  widget: Text(
                    'اضف اعلان',
                    style: GoogleFonts.cairo(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: ThemeApp.secondaryColor,
                    ),
                  ),
                  color: ThemeApp.primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NewList extends StatelessWidget {
  const NewList({
    Key? key,
    required this.categoryMainModel,
    required this.productModel,
  }) : super(key: key);

  final CategoryMainModel categoryMainModel;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var cubit = SwapCubit.get(context);
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return Product(productModel: cubit.productModel[index]);
          },
          separatorBuilder: (context, _) {
            return const DSize(height: 20, width: 0);
          },
          itemCount: cubit.productModel.length,
        );
      },
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, AdsScreen.routeName);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            height: 90,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (productModel.image.isEmpty)
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: Icon(FontAwesomeIcons.info),
                  ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Image.network(productModel.image),
                ),
                const DSize(height: 0, width: 60),
                Text(
                  productModel.name,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: ThemeApp.primaryColor,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
