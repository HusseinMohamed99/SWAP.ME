import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/shared/styles/theme.dart';

Widget defaultMaterialButton({
  required Function() function,
  required String text,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Function? onTap,
}) => Container(
      width: width ?? 320,
      height: height ?? 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius ?? 10,
        ),
        color: color,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 22,
        minWidth: 59,
        onPressed: function,
        child: FittedBox(
          child: Text(
            textAlign: TextAlign.center,
            isUpperCase ? text.toUpperCase() : text,
            style: GoogleFonts.roboto(
              fontSize: 19,
              color: ThemeApp.secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );

Widget defaultButton({
  required Function() function,
  required Widget widget,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Function? onTap,
}) => Container(
  width: width ?? 310,
      height: height ?? 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius ?? 10,
        ),
        color: color,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 22,
        minWidth: 59,
        onPressed: function,
        child: FittedBox(
          child: widget,
        ),
      ),
    );

