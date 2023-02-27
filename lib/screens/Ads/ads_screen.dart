import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/screens/Ads/ads_details.dart';
import 'package:swap_me/shared/components/buttons.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/styles/theme.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({Key? key}) : super(key: key);
  static const String routeName = 'AdsScreen';

  @override
  Widget build(BuildContext context) {
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
          'Clothes',
          style: GoogleFonts.cairo(
            color: ThemeApp.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
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
                              child: Image.asset(
                                'assets/images/55.png',
                                width: 105,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Levis shirt For men,s Original',
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
                                      Icons.location_on_outlined,
                                      color: ThemeApp.primaryColor,
                                    ),
                                    const DSize(height: 0, width: 5),
                                    Text(
                                      'data',
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
                                      Icons.watch_later_outlined,
                                      color: ThemeApp.primaryColor,
                                    ),
                                    const DSize(height: 0, width: 5),
                                    Text(
                                      'Cairo',
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
                                        function: () {
                                          //Navigator.pushNamed(context, SignInScreen.routeName);
                                        },
                                        widget: Text(
                                          '010123456789',
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
                                        ))
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
        separatorBuilder: (context, _) {
          return const DSize(height: 10, width: 0);
        },
        itemCount: 5,
      ),
    );
  }
}
