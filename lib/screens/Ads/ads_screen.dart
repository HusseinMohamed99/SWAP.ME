import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/model/ads_model.dart';
import 'package:swap_me/model/arg_model.dart';
import 'package:swap_me/model/category_model.dart';
import 'package:swap_me/model/product_model.dart';
import 'package:swap_me/screens/Ads/ads_details.dart';
import 'package:swap_me/shared/components/buttons.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/constants/constants.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_cubit.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';
import 'package:swap_me/shared/styles/theme.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({Key? key}) : super(key: key);
  static const String routeName = 'AdsScreen';

  @override
  Widget build(BuildContext context) {
    ScreenArgs screenArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {},
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
              screenArgs.productModel.name,
              style: GoogleFonts.cairo(
                color: ThemeApp.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          body: LIstAds(
            screenArgs.categoryMainModel,
            screenArgs.productModel,
            adsModel: screenArgs.adsModel,
          ),
        );
      },
    );
  }
}

class LIstAds extends StatelessWidget {
  const LIstAds(
    this.categoryMainModel,
    this.productModel, {
    Key? key,
    required this.adsModel,
  }) : super(key: key);

  final CategoryMainModel categoryMainModel;
  final ProductModel productModel;
  final AdsModel adsModel;

  @override
  Widget build(BuildContext context) {
    var cubit = SwapCubit.get(context);
    return ListView.separated(
      itemBuilder: (context, index) {
        return ADS(categoryMainModel, productModel,
            adsModel: cubit.adsNewModel[index]);
      },
      separatorBuilder: (context, _) {
        return const DSize(height: 10, width: 0);
      },
      itemCount: cubit.adsNewModel.length,
    );
  }
}

class ADS extends StatelessWidget {
  const ADS(
    this.categoryMainModel,
    this.productModel, {
    Key? key,
    required this.adsModel,
  }) : super(key: key);

  final ProductModel productModel;
  final CategoryMainModel categoryMainModel;
  final AdsModel adsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AdsDetails.routeName);
            },
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              adsModel.image,
                              width: 105,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                adsModel.name,
                                style: GoogleFonts.cairo(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.primaryColor,
                                ),
                              ),
                              const DSize(height: 6, width: 0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: ThemeApp.primaryColor,
                                  ),
                                  const DSize(height: 0, width: 5),
                                  Text(
                                    'منذ ${daysBetween(DateTime.parse(adsModel.dateTime.toString()))}',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeApp.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: ThemeApp.primaryColor,
                                  ),
                                  const DSize(height: 0, width: 5),
                                  Text(
                                    'مصر، القاهرة',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeApp.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const DSize(height: 5, width: 0),
                              Row(
                                children: [
                                  Expanded(
                                    child: defaultButton(
                                      function: () {},
                                      widget: Text(
                                        SwapCubit.get(context).userModel!.phone,
                                        style: GoogleFonts.cairo(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeApp.secondaryColor,
                                        ),
                                      ),
                                      color: ThemeApp.primaryColor,
                                    ),
                                  ),
                                  const DSize(height: 0, width: 20),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: ThemeApp.primaryColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
