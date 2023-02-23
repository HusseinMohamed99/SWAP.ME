import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:swap_me/screens/SignIn/sign_in_screen.dart';
import 'package:swap_me/shared/components/buttons.dart';
import 'package:swap_me/shared/components/navigator.dart';
import 'package:swap_me/shared/components/sized_box.dart';
import 'package:swap_me/shared/components/text_form_field.dart';
import 'package:swap_me/shared/constants/constants.dart';
import 'package:swap_me/shared/cubit/signUpCubit/sign_up_cubit.dart';
import 'package:swap_me/shared/cubit/signUpCubit/sign_up_state.dart';
import 'package:swap_me/shared/network/cache_helper.dart';
import 'package:swap_me/shared/styles/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = 'signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var firstnameController = TextEditingController();
    var lastnameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var phoneController = TextEditingController();
    var dateTimeController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {}
          if (state is UserCreateSuccessState) {
            CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
              uId = state.uid;

              //   navigateAndFinish(context, routeName: CitiesScreen.routeName);
            });
          } else if (state is SignUpErrorState) {}
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 245, 245, 245),
            appBar: AppBar(
              toolbarHeight: 30,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'انشاء حساب',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const DSize(height: 15, width: 0),
                      Text(
                        'أدخل بياناتك للانضمام إلى قايضني',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const DSize(width: 0, height: 20),
                      DefaultTextFormField(
                        color: ThemeApp.secondaryColor.withOpacity(0.3),
                        context: context,
                        controller: firstnameController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email Address is Required';
                          }
                          return null;
                        },
                        hint: 'الاسم الاول',
                        prefix: Icons.supervised_user_circle_sharp,
                      ),
                      const DSize(width: 0, height: 26),
                      DefaultTextFormField(
                        color: ThemeApp.secondaryColor.withOpacity(0.3),
                        context: context,
                        controller: lastnameController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email Address is Required';
                          }
                          return null;
                        },
                        hint: 'الاسم الاخير',
                        prefix: Icons.person,
                      ),
                      const DSize(width: 0, height: 26),
                      DefaultTextFormField(
                        color: ThemeApp.secondaryColor.withOpacity(0.3),
                        context: context,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email Address is Required';
                          }
                          return null;
                        },
                        hint: 'البريد الالكتروني',
                        prefix: Icons.alternate_email_outlined,
                      ),
                      const DSize(width: 0, height: 26),
                      DefaultTextFormField(
                        color: ThemeApp.secondaryColor.withOpacity(0.3),
                        context: context,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your Password';
                          } else if (passwordController.text.trim() !=
                              confirmPasswordController.text.trim()) {
                            return "your Password doesn't same";
                          }

                          return null;
                        },
                        prefix: SignUpCubit.get(context).suffix,
                        isPassword: SignUpCubit.get(context).isPassword,
                        prefixPressed: () {
                          SignUpCubit.get(context).showPassword();
                        },
                        hint: 'كلمه المرور',
                      ),
                      const DSize(width: 0, height: 26),
                      DefaultTextFormField(
                        color: ThemeApp.secondaryColor.withOpacity(0.3),
                        context: context,
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your Confirm Password';
                          }
                          if (value.trim().length <= 6) {
                            return 'No';
                          } else if (passwordController.text.trim() !=
                              confirmPasswordController.text.trim()) {
                            return "your confirm Password doesn't same";
                          }

                          return null;
                        },
                        prefix: SignUpCubit.get(context).suffix,
                        isPassword: SignUpCubit.get(context).isPassword,
                        prefixPressed: () {
                          SignUpCubit.get(context).showPassword();
                        },
                        hint: 'تأكيد كلمه المرور',
                      ),
                      const DSize(width: 0, height: 26),
                      DefaultTextFormField(
                        color: ThemeApp.secondaryColor.withOpacity(0.3),
                        context: context,
                        controller: dateTimeController,
                        keyboardType: TextInputType.datetime,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password is Required';
                          }
                          return null;
                        },
                        prefix: Icons.keyboard_arrow_down,
                        prefixPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 18250)),
                            lastDate: DateTime.now(),
                          ).then((value) {
                            dateTimeController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                        hint: 'تاريخ الميلاد',
                      ),
                      const DSize(width: 0, height: 26),
                      DefaultTextFormField(
                        color: ThemeApp.secondaryColor.withOpacity(0.3),
                        context: context,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Phone is Required';
                          } else if (value.length != 11) {
                            return 'Sorry, your phone must be\n 11 numbers long.';
                          } else {
                            return null;
                          }
                        },
                        prefix: Icons.phone,
                        hint: 'ادخل رقم الهاتف',
                      ),
                      const DSize(width: 0, height: 26),
                      defaultMaterialButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              SignUpCubit.get(context).userSignUp(
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                                firstName: firstnameController.text,
                                lastName: lastnameController.text,
                              );
                              emailController.clear();
                              passwordController.clear();
                              firstnameController.clear();
                              lastnameController.clear();
                            }
                          },
                          text: 'تسجيل الدخول',
                          color: ThemeApp.primaryColor),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                navigateTo(context,
                                    routeName: SignInScreen.routeName);
                              },
                              child: Text(
                                'هل لديك حساب ؟  تسجيل الدخول الان',
                                style: GoogleFonts.cairo(
                                  color: ThemeApp.primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void buildShowDatePicker(BuildContext context) async {
    var userSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 18250)),
      lastDate: DateTime.now(),
    );
    if (userSelectedDate == null) {
      return;
    }

    setState(() {
      //widget.tasks.dateTime = userSelectedDate;
    });
  }
}