import 'package:flutter/material.dart';
import 'package:warraq/core/constants/app_fonts.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.center,
    this.decoration, this.overflow,
  });

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          decoration: decoration,
          fontSize: fontSize,
          color: color,
          overflow: overflow,
          fontWeight: fontWeight,
          fontFamily: AppFonts.noorFontFonts),
    );
  }
}
