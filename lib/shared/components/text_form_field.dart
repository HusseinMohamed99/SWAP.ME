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
      this.suffix,
      this.suffixPressed,
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
  final IconData? suffix;
  final IconData? prefix;
  final Function? suffixPressed;
  final TextStyle? style;
  final String? obscuringCharacter;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      style: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        color: styleColor ?? ThemeApp.secondaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      minLines: 1,
      obscuringCharacter: obscuringCharacter ?? '*',
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
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            prefix,
            color: prefixColor ?? ThemeApp.secondaryColor,
            size: 24,
          ),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                padding: const EdgeInsets.all(15.0),
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                  color: ThemeApp.secondaryColor,
                  size: 24,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0),
          ),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: ThemeApp.secondaryColor.withOpacity(0.8),
          height: 1,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: ThemeApp.primaryColor,
          height: 1,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0),
          ),
          borderSide: BorderSide(
            color: borderSideColor ?? ThemeApp.secondaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0),
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(12.0),
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
