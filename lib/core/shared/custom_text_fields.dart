import 'package:flutter/material.dart';
import 'package:warraq/core/constants/app_fonts.dart';
import 'package:warraq/core/utils/extension/extension.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
  });

  final String hintText;
  final bool obscureText;
  final String? Function(String? value)? validator;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      textDirection: TextDirection.ltr,
      autocorrect: true,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
          errorStyle: TextStyle(fontFamily: AppFonts.noorFontFonts),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: AppFonts.noorFontFonts,
              fontSize: 14,
              color: Colors.grey),
          fillColor: context.isDarkMode
              ? const Color(0xFF434343)
              : const Color(0xFFF8F8F8),
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.all(13),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14))),
    );
  }
}
