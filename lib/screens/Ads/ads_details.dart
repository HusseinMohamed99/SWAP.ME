import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/screens/Ads/image_details.dart';
import 'package:swap_me/shared/components/buttons.dart';
import 'package:swap_me/shared/components/my_divider.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/styles/theme.dart';

class AdsDetails extends StatelessWidget {
  const AdsDetails({Key? key}) : super(key: key);
  static const String routeName = 'AdsDetails';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          items: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ImageDetails.routeName);
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/55.png',
                                      width: 105,
                                    )),
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                            height: 300,
                            enlargeCenterPage: false,
                            disableCenter: true,
                            viewportFraction: 0.7,
                            autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                          ),
                        ),
                      ],
                    ),
                    const DSize(height: 160, width: 0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'التفاصيل الرئيسيه',
                            style: GoogleFonts.cairo(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ThemeApp.primaryColor,
                            ),
                          ),
                          const DSize(height: 12, width: 0),
                          Row(
                            children: [
                              Text(
                                'القسم',
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.greyColor,
                                ),
                              ),
                              const DSize(height: 0, width: 40),
                              Text(
                                'الملابس ومستحضرات التجميل',
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          const MyDivider(),
                          Row(
                            children: [
                              Text(
                                'القسم الفرعي',
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.greyColor,
                                ),
                              ),
                              const DSize(height: 0, width: 40),
                              Text(
                                'ملابس رجالي',
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          const MyDivider(
                            padding: 6,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'الوصف',
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.greyColor,
                                ),
                              ),
                              const DSize(height: 2, width: 0),
                              Text(
                                'قميص ليفايس اوريجنال صناعه امريكي مقاس ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const DSize(height: 130, width: 0),
                          defaultButton(
                            function: () {
                              //Navigator.pushNamed(context, SignInScreen.routeName);
                            },
                            widget: Text(
                              'مقايضه',
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
                  ],
                ),
                Positioned(
                  // top: 391,
                  top: 228,
                  left: 18,
                  right: 18,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 240,
                    width: 392,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: ThemeApp.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 47,
                          height: 27,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye_outlined,
                                color: ThemeApp.greyColor,
                              ),
                              DSize(height: 0, width: 5),
                              Text(
                                '5',
                                style: GoogleFonts.cairo(
                                  fontSize: 12,
                                  color: ThemeApp.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Levis shirt For men,s Original',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeApp.secondaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: ThemeApp.secondaryColor,
                                  ),
                                  const DSize(height: 0, width: 5),
                                  Text(
                                    'Cairo',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: ThemeApp.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        MyDivider(),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/Group 517.svg'),
                            DSize(height: 0, width: 30),
                            Text(
                              'USER NAME'.toUpperCase(),
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: ThemeApp.secondaryColor,
                              ),
                            ),
                            DSize(height: 0, width: 23),
                            MyDivider(
                              width: 1,
                              height: 30,
                            ),
                            DSize(height: 0, width: 23),
                            Text(
                              '010123456789',
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: ThemeApp.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        MyDivider(),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.locationDot,
                              color: ThemeApp.secondaryColor,
                            ),
                            DSize(height: 0, width: 30),
                            Text(
                              'القاهره ،مصر',
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: ThemeApp.secondaryColor,
                              ),
                            ),
                            DSize(height: 0, width: 23),
                            MyDivider(
                              width: 1,
                              height: 30,
                            ),
                            DSize(height: 0, width: 23),
                            Icon(
                              Icons.star,
                              color: ThemeApp.secondaryColor,
                            ),
                            DSize(height: 0, width: 8),
                            Text(
                              'تقييم (0.0)',
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: ThemeApp.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // top: 391,
                  top: 10,
                  left: 10,

                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: ThemeApp.primaryColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // top: 391,
                  top: 180,
                  left: 180,

                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera_alt,
                          color: ThemeApp.primaryColor,
                        ),
                        Text('1/2')
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // top: 391,
                  top: 10,
                  right: 10,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.more_vert_sharp,
                            color: ThemeApp.primaryColor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: ThemeApp.primaryColor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.share_sharp,
                            color: ThemeApp.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
