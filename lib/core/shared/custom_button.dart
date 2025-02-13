import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warraq/core/constants/app_color.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.fontSize,
      this.reverseColor = false,
      this.width,
      this.height,
      this.padding,
      this.mainAxisAlignment,
      this.margin,
      this.icon,
      this.lightColor,
      this.darkColor});

  final Color? lightColor;
  final Color? darkColor;
  final double? height;
  final double? width;
  final String text;
  final Function()? onTap;
  final double? fontSize;
  final bool reverseColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final MainAxisAlignment? mainAxisAlignment;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          height: height ?? 55,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
              color: reverseColor
                  ? lightColor ?? AppColor.kPrimaryColor
                  : darkColor ?? Colors.black,
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            children: [
              CustomText(
                  text: text,
                  fontSize: fontSize ?? 18,
                  color: reverseColor ? Colors.black : Colors.white),
              if (icon != null) ...[
                const Spacer(),
                SvgPicture.asset(
                  icon!,
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                      reverseColor ? Colors.black : Colors.white,
                      BlendMode.srcIn),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
