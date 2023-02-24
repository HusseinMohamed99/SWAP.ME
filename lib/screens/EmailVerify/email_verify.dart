import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/screens/HomeScreen/home_screen.dart';
import 'package:swap_me/screens/Password/forgot_password.dart';
import 'package:swap_me/shared/components/buttons.dart';
import 'package:swap_me/shared/components/navigator.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/cubit/emailVerifyCubit/email_verify_cubit.dart';
import 'package:swap_me/shared/cubit/emailVerifyCubit/email_verify_state.dart';
import 'package:swap_me/shared/styles/theme.dart';

class EmailVerify extends StatelessWidget {
  const EmailVerify({Key? key}) : super(key: key);
  static const String routeName = 'EmailVerify';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EmailVerificationCubit(),
      child: BlocConsumer<EmailVerificationCubit, EmailVerificationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = EmailVerificationCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 20,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'قم بتأكيد بريدك الالكتروني',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const DSize(height: 20, width: 0),
                  Text(
                    'تحقق من بريدك الالكتروني وانقر  علي الرابط\n لتنشيط  حسابك',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(height: 3),
                    textAlign: TextAlign.center,
                  ),
                  const DSize(width: 0, height: 125),
                  Image.asset(
                    'assets/images/Group 380.png',
                    alignment: Alignment.center,
                  ),
                  const Spacer(),
                  state is SendVerificationLoadingState
                      ? const CircularProgressIndicator()
                      : cubit.isEmailSent
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 19, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(context,
                                          routeName: ForgotPassword.routeName);
                                    },
                                    child: Text(
                                      'لم تستلم الرمز؟',
                                      style: GoogleFonts.cairo(
                                        color: ThemeApp.primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : defaultMaterialButton(
                              function: () {
                                cubit.sendEmailVerification();
                              },
                              text: 'ارسال',
                              color: ThemeApp.primaryColor),
                  if (cubit.isEmailSent)
                    defaultMaterialButton(
                        function: () {
                          cubit.reloadUser().then(
                            (value) {
                              if (cubit.isEmailVerified) {
                                navigateAndFinish(context,
                                    routeName: HomeScreen.routeName);
                              } else {}
                            },
                          );
                        },
                        text: 'الصفحة الرئيسية',
                        color: ThemeApp.primaryColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
