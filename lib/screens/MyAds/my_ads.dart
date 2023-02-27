import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/model/ads_model.dart';
import 'package:swap_me/shared/components/buttons.dart';
import 'package:swap_me/shared/components/my_divider.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_cubit.dart';
import 'package:swap_me/shared/cubit/swapCubit/swap_state.dart';
import 'package:swap_me/shared/styles/theme.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({Key? key}) : super(key: key);
  static const String routeName = 'MyAdsScreen';

  @override
  Widget build(BuildContext context) {
    var cubit = SwapCubit.get(context);
    return BlocConsumer<SwapCubit, SwapStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'الإعلانات :',
                    style: GoogleFonts.cairo(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: ThemeApp.primaryColor,
                    ),
                  ),
                  DSize(height: 0, width: 10),
                  Text(
                    '${cubit.userAds.length}',
                    style: GoogleFonts.cairo(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: ThemeApp.primaryColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: cubit.userAds.length,
                  separatorBuilder: (context, index) =>
                      DSize(height: 10, width: 0),
                  itemBuilder: (context, index) =>
                      (buildAdsItem(context, cubit.userAds[index])),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAdsItem(context, AdsModel adsModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '${adsModel.image}',
                          width: 105,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${adsModel.name}',
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
                                  ' منذ ساعه',
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
                                  'القاهره ،مصر',
                                  style: GoogleFonts.cairo(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeApp.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                MyDivider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 242, 242, 242),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.edit, color: ThemeApp.greyColor),
                            Text(
                              'تعديل',
                              style: GoogleFonts.cairo(
                                color: ThemeApp.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 242, 242, 242),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.delete_forever,
                              color: Color.fromARGB(255, 234, 53, 73),
                            ),
                            Text(
                              'حذف',
                              style: GoogleFonts.cairo(
                                color: Color.fromARGB(255, 234, 53, 73),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 242, 242, 242),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: ThemeApp.greyColor,
                            ),
                            Text(
                              '10',
                              style: GoogleFonts.cairo(
                                color: ThemeApp.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 242, 242, 242),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.share_sharp,
                              color: ThemeApp.greyColor,
                            ),
                            Text(
                              'مشاركه',
                              style: GoogleFonts.cairo(
                                color: ThemeApp.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MyDivider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star_border,
                        color: ThemeApp.primaryColor,
                      ),
                      Icon(
                        Icons.star_border,
                        color: ThemeApp.primaryColor,
                      ),
                      Icon(
                        Icons.star_border,
                        color: ThemeApp.primaryColor,
                      ),
                      Icon(
                        Icons.star_border,
                        color: ThemeApp.primaryColor,
                      ),
                      Icon(
                        Icons.star_border,
                        color: ThemeApp.primaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
