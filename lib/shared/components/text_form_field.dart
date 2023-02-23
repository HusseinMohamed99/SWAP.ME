import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swap_me/shared/styles/theme.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {required this.context,
      required this.controller,
      required this.keyboardType,
      required this.validate,
      this.hint,
      this.label,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscuringCharacter,
      this.style,
      this.color,
      this.borderSideColor,
      this.prefixColor,
      this.styleColor,
      this.focusNode,
      this.isClickable,
      this.isPassword,
      this.decoration,
      this.prefixPressed,
      this.prefix,
      this.maxLength,
      Key? key})
      : super(key: key);
  final BuildContext context;
  final FocusNode? focusNode;
  final Color? color;
  final Color? borderSideColor;
  final Color? styleColor;
  final Color? prefixColor;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validate;
  final String? hint;
  final String? label;
  final dynamic onTap;
  final dynamic onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? isPassword;
  final bool? isClickable;
  final InputDecoration? decoration;
  final IconData? prefix;
  final Function? prefixPressed;
  final TextStyle? style;
  final String? obscuringCharacter;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      maxLength: maxLength,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.end,
      style: GoogleFonts.cairo(
        fontStyle: FontStyle.normal,
        color: styleColor ?? ThemeApp.blackPrimary,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      minLines: 1,
      controller: controller,
      validator: validate,
      enabled: isClickable ?? true,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: isPassword ?? false,
      keyboardType: keyboardType,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 20),
        fillColor: color,
        filled: true,
        prefixIcon: prefix != null
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  prefixPressed!();
                },
                icon: Icon(
                  prefix,
                  color: ThemeApp.greyColor,
                  size: 24,
                ),
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          locale: Locale('en'),
          color: ThemeApp.greyColor,
          height: 1,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          locale: Locale('en'),
          color: ThemeApp.primaryColor,
          height: 1,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: borderSideColor ?? ThemeApp.greyColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
