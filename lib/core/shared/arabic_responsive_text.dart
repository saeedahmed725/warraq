import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';
import 'package:warraq/core/constants/app_fonts.dart';


class ResponsiveText extends StatelessWidget {
  const  ResponsiveText({
    super.key,
    required this.text,
    this.color,
    this.textDirection = TextDirection.rtl,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.shadows,
    this.textAlign,
    this.maxLines,
    this.isSelectable = false,
  });

  final String text;
  final Color? color;
  final TextDirection textDirection;
  final List<Shadow>? shadows;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isSelectable;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: color,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight,
      shadows: shadows,
      letterSpacing: 0,
      wordSpacing: 0,
      overflow: overflow,
      fontFamily: fontFamily ?? AppFonts.uthmanicFonts,
    );

    return isSelectable
        ? SelectableText(
            text,
            textDirection: textDirection,
            textAlign: textAlign ?? TextAlign.justify,
            maxLines: maxLines,
            style: textStyle,
          )
        : Text(
            key: key,
            text,
            textDirection: textDirection,
            textAlign: textAlign ?? TextAlign.justify,
            maxLines: maxLines,
            style: textStyle,
          );
  }
}

class ArabicRichResponsiveText extends StatelessWidget {
  const ArabicRichResponsiveText(
      {super.key,
      this.text,
      this.color,
      this.textDirection = TextDirection.rtl,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.children,
      this.shadows,
      this.textAlign,
      this.textSpan});

  final String? text;
  final Color? color;
  final TextDirection textDirection;
  final String? fontFamily;
  final double? fontSize;
  final List<Shadow>? shadows;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final List<TextSpan>? children;
  final TextAlign? textAlign;
  final TextSpan? textSpan;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: textSpan ??
          TextSpan(
            text: text,
            children: children,
            style: TextStyle(
                color: color,
                fontSize: fontSize ?? 18,
                fontWeight: fontWeight,
                shadows: shadows,
                letterSpacing: 0,
                wordSpacing: 0.1,
                overflow: overflow,
                fontFamily: fontFamily ?? AppFonts.hafswarraqFonts),
          ),
      textDirection: textDirection,
      textAlign: textAlign ?? TextAlign.justify,
    );
  }
}

class ArabicDecoratedText extends StatelessWidget {
  const ArabicDecoratedText({
    super.key,
    required this.text,
    this.color,
    this.textDirection = TextDirection.rtl,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.shadows,
    this.textAlign,
    this.maxLines, required this.rules,
  });

  final String text;
  final Color? color;
  final TextDirection textDirection;
  final List<Shadow>? shadows;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final List<DecoratorRule> rules;
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: color,
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight,
      shadows: shadows,
      letterSpacing: 0,
      wordSpacing: 0,
      overflow: overflow,
      fontFamily: fontFamily ?? AppFonts.uthmanicFonts,
    );

    return DecoratedText(
      key: key,
      text: text,
      textDirection: textDirection,
      textAlign: textAlign ?? TextAlign.justify,
      maxLines: maxLines,
      style: textStyle,
      rules: rules,
    );
  }
}
