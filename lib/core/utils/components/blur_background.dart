import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  const BlurBackground(
      {super.key,
      this.borderRadius = BorderRadius.zero,
      this.sigmaX,
      this.sigmaY,
      this.child,
      this.blendMode = BlendMode.srcOver,
      this.color,
      this.image,
      this.border,
      this.boxShadow,
      this.gradient,
      this.backgroundBlendMode,
      this.shape = BoxShape.rectangle,
      this.decoration,
      this.width,
      this.height,
      this.padding,
      this.margin});

  final BorderRadiusGeometry borderRadius;
  final double? sigmaX;
  final double? sigmaY;
  final Widget? child;
  final BlendMode blendMode;
  final Color? color;
  final DecorationImage? image;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape shape;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX ?? 5.0, sigmaY: sigmaY ?? 5.0),
        blendMode: blendMode,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            border: border,
            boxShadow: boxShadow,
            gradient: gradient,
            backgroundBlendMode: backgroundBlendMode,
            shape: shape,
            image: image,
          ),
          child: child,
        ),
      ),
    );
  }
}
