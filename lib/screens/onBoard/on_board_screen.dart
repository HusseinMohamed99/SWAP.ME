import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swap_me/screens/onBoard/boarding_screen.dart';
import 'package:swap_me/shared/network/cache_helper.dart';

class BoardingModel {
  final String image;
  final String imageTitle;
  final String? body;
  final String title;

  BoardingModel({
    required this.image,
    required this.imageTitle,
    this.body,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const String routeName = 'onboard';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboard1.png',
      imageTitle: 'assets/images/swapMe.png',
      title: 'هو تطبيق  للأشخاص الذين يرغبون في إعطاء',
      body: ' أو مبادلة أغراضهم',
    ),
    BoardingModel(
      image: 'assets/images/onboard2.png',
      imageTitle: 'assets/images/takePhoto.png',
      title: 'من بين كل الأشياء التي لا تحتاجها',
    ),
    BoardingModel(
      image: 'assets/images/onboard3.png',
      imageTitle: 'assets/images/lookFor.png',
      title: 'وقم التواصل مع المقايض',
    ),
    BoardingModel(
      image: 'assets/images/onboard4.png',
      imageTitle: 'assets/images/createAccount.png',
      title: ' عرض وتبادل ما لا تحتاجه',
    ),
  ];
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        Navigator.of(context).pushReplacementNamed(
          BoardingScreen.routeName,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              isLast ? '' : 'تخطي',
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 74, 134),
                fontSize: 16,
                fontFamily: 'FFShamelFamily',
                fontWeight: FontWeight.bold,
              ),

              // style: TextStyle(

              // ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: pageController,
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: boarding.length,
                effect: const ExpandingDotsEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  dotColor: Color.fromARGB(255, 189, 211, 208),
                  activeDotColor: Color.fromARGB(255, 0, 74, 134),
                  radius: 20.0,
                  spacing: 6,
                  expansionFactor: 1.01,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              isLast
                  ? SizedBox(
                width: 354,
                    height: 44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 74, 134),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, BoardingScreen.routeName);
                        },
                        child: const Text(
                          'ابدأ',
                          style: TextStyle(
                            fontFamily: 'FFShamelFamily',
                            fontSize: 18,
                          ),
                        ),
                      ),
                  )
                  : Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                        ),
                        child: const Text(
                          'التالي',
                          style: TextStyle(
                              fontFamily: 'FFShamelFamily',
                              color: Color.fromARGB(255, 0, 74, 134),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),

                          // style: TextStyle(

                          // ),
                        ),
                        onPressed: () {
                          if (isLast) {
                            submit();
                          } else {
                            pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 780,
                              ),
                              curve: Curves.bounceInOut,
                            );
                          }
                        },
                      ),
                    ),
              const SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Image(
                image: AssetImage(
                  model.image,
                ),
              ),
            ),
            SizedBox(
              height: 75,
              child: Image(
                image: AssetImage(
                  model.imageTitle,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontFamily: 'FFShamelFamily',
                    fontSize: 19,
                    color: Color.fromARGB(255, 152, 150, 150),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  model.body ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'FFShamelFamily',
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 152, 150, 150),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
