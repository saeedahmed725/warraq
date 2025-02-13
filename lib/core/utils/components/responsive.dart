// import 'dart:developer';
//
// import 'package:flutter/material.dart';
//
// class ResponsiveLayout extends StatelessWidget {
//   static ResponsiveFunctions get of => ResponsiveFunctions(context);
//
//   static get globalContext => context;
//
//   const ResponsiveLayout(
//       {super.key,
//       required this.mobile,
//       required this.tablet,
//       required this.desktop});
//
//   final WidgetBuilder mobile, tablet, desktop;
//
//   @override
//   Widget build(BuildContext context) {
//     final responsiveFunctions = ResponsiveFunctions(context);
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth < 600) {
//           return mobile(context);
//         } else if (constraints.maxWidth < 1200) {
//           return tablet(context);
//         } else {
//           return desktop(context);
//         }
//       },
//     );
//   }
//
//   static double getResponsiveSize({required double size, double? factor}) {
//     double scaleFactor = of.getScaleFactor();
//     double responsiveSize =
//         size * scaleFactor * (of.isMobile ? factor ?? 0.7 : 1);
//     double lowerLimit = size * 0.6;
//     double upperLimit = size * 1.2;
//     log('Responsive Size: ${responsiveSize.clamp(lowerLimit, upperLimit)} Scale Factor: $scaleFactor',
//         name: 'Responsive Size');
//     return responsiveSize.clamp(lowerLimit, upperLimit);
//   }
//
//   static double getResponsiveFontSize({required double size}) {
//     double scaleFactor = of.getScaleFactor();
//     double responsiveSize = size * scaleFactor * (of.isMobile ? 0.7 : 1);
//     double lowerLimit = size * 0.6;
//     double upperLimit = size * 1.2;
//     log('Responsive Size: ${responsiveSize.clamp(lowerLimit, upperLimit)} Scale Factor: $scaleFactor',
//         name: 'Responsive Size');
//     return responsiveSize.clamp(lowerLimit, upperLimit);
//   }
// }
//
// class ResponsiveFunctions {
//   set context(BuildContext context) {
//     _context = context;
//   }
//
//   late final BuildContext _context;
//
//   ResponsiveFunctions._(this._context) {
//     printDebug();
//   }
//
//   static ResponsiveFunctions? _instance;
//
//   /// Factory constructor to provide a singleton instance
//   factory ResponsiveFunctions(BuildContext context) {
//     if (_instance == null || _instance!._context != context) {
//       _instance = ResponsiveFunctions._(context);
//     }
//     return _instance!;
//   }
//
//   // Platform width thresholds
//   final Map<PlatType, double> _widthThresholds = {
//     PlatType.isMobileS: 300,
//     PlatType.isMobileM: 400,
//     PlatType.isMobileL: 500,
//     PlatType.isMobileXL: 600,
//     PlatType.isTabletS: 700,
//     PlatType.isTabletM: 800,
//     PlatType.isTabletL: 1050,
//     PlatType.isDesktopS: 1150,
//     PlatType.isDesktopM: 1300,
//     PlatType.isDesktopL: double.infinity,
//   };
//
//   // Getters for responsive checks
//   bool get isMobile => width <= _widthThresholds[PlatType.isMobileXL]!;
//
//   bool get isTablet =>
//       width > _widthThresholds[PlatType.isMobileXL]! &&
//       width <= _widthThresholds[PlatType.isTabletL]!;
//
//   bool get isDesktop => width > _widthThresholds[PlatType.isTabletL]!;
//
//   // Getters for specific platforms
//   bool get isMobileS => width <= _widthThresholds[PlatType.isMobileS]!;
//
//   bool get isMobileM =>
//       width > _widthThresholds[PlatType.isMobileS]! &&
//       width <= _widthThresholds[PlatType.isMobileM]!;
//
//   bool get isMobileL =>
//       width > _widthThresholds[PlatType.isMobileM]! &&
//       width <= _widthThresholds[PlatType.isMobileL]!;
//
//   bool get isMobileXL =>
//       width > _widthThresholds[PlatType.isMobileL]! &&
//       width <= _widthThresholds[PlatType.isMobileXL]!;
//
//   // Utility getters
//   Size get size => MediaQuery.sizeOf(_context);
//
//   Orientation get orientation => MediaQuery.orientationOf(_context);
//
//   double get width => size.width;
//
//   double get height => size.height;
//
//   bool get isPortrait => orientation == Orientation.portrait;
//
//   // Get platform type
//   PlatType get getPlat {
//     for (var entry in _widthThresholds.entries) {
//       if (width <= entry.value) return entry.key;
//     }
//     throw Exception("Unrecognized platform for width: $width");
//   }
//
//   // Unified function for size adjustments
//   double adjustSize(double desktop, double tablet, double mobile) {
//     if (isDesktop) return desktop;
//     if (isTablet) return tablet;
//     return mobile;
//   }
//
//   // Scale factor calculation
//   double getScaleFactor() {
//     for (var entry in _widthThresholds.entries) {
//       if (width <= entry.value) {
//         return width / entry.value;
//       }
//     }
//     throw Exception("Invalid scale factor for width: $width");
//   }
//
//   // Size by screen dimension
//   double getSizeByScreen(double desktop, double tablet, double mobile,
//       {bool isHeight = false}) {
//     final dim = isHeight ? height : width;
//     if (isDesktop) return dim * desktop;
//     if (isTablet) return dim * tablet;
//     if (isMobile) return dim * mobile;
//     throw Exception("Invalid size calculation for dimension: $dim");
//   }
//
//   // Orientation-specific size
//   double getSizeByOrientation({
//     required double desktop,
//     required double tablet,
//     required double mobile,
//   }) =>
//       orientation == Orientation.portrait
//           ? getSizeByScreen(desktop, tablet, mobile, isHeight: true)
//           : getSizeByScreen(desktop, tablet, mobile);
//
//   // Debug information
//   void printDebug() {
//     log("""
// Plat Type: $getPlat
// Width: $width
// Height: $height
// Orientation: $orientation
// Scale Factor: ${getScaleFactor()}
// """, name: 'Responsive Debug Info');
//   }
// }
//
// // Enum for platform types
// enum PlatType {
//   isMobileS,
//   isMobileM,
//   isMobileL,
//   isMobileXL,
//   isTabletS,
//   isTabletM,
//   isTabletL,
//   isDesktopS,
//   isDesktopM,
//   isDesktopL,
// }
