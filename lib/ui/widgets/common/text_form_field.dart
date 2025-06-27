import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tournament_app/constants/app_color.dart';

class Textformfield extends StatelessWidget {
  final String? value;
  final String hintText;
  final TextEditingController? controller;
  final bool enabled;
  final bool obscureText;
  final TextStyle? textStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  const Textformfield({
    super.key,
    this.value,
    required this.hintText,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.textColor,
  });

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54, fontSize: fontSize?.sp ?? 13.sp),
      filled: true,
      isDense: true,
      fillColor: ColorSchemeX.textFieldFillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: ColorSchemeX.secondaryColorDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: ColorSchemeX.textColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: ColorSchemeX.secondaryColorDark),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        this.textStyle ??
        TextStyle(
          fontSize: fontSize?.sp ?? 13.sp,
          fontWeight: fontWeight,
          color: textColor ?? ColorSchemeX.textColorDark,
        );

    return TextFormField(
      initialValue: value,
      controller: controller,
      enabled: enabled,
      obscureText: obscureText,
      style: textStyle,
      decoration: _inputDecoration(hintText),
    );
  }
}
