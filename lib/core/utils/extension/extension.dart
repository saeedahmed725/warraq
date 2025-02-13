import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension GapSizeBox on num {
  SizedBox get heightGap => SizedBox(height: toDouble());

  SizedBox get widthGap => SizedBox(width: toDouble());
}

extension Blocsr on BuildContext {
  // uncomment this if u need it
  T cubit<T extends Cubit>() => BlocProvider.of<T>(this);
  T bloc<T extends Bloc>() => BlocProvider.of<T>(this);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String cutString(maxLen) {
    if (length >= maxLen) {
      return "${substring(0, maxLen)}...";
    } else {
      return this;
    }
  }

  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension ContextExtension on BuildContext {
  bool get isDarkMode => theme.brightness == Brightness.dark;

  String get locale => Localizations.localeOf(this).languageCode;

  // AppLocalizations get tr {
  //   return AppLocalizations.of(this)!;
  // }
}

extension BuildContextSizesExtension<T> on BuildContext {
  bool get isMobile => MediaQuery.sizeOf(this).width <= 500.0;

  bool get isTablet =>
      MediaQuery.sizeOf(this).width < 1024.0 &&
      MediaQuery.sizeOf(this).width >= 650.0;

  bool get isSmallTablet =>
      MediaQuery.sizeOf(this).width < 650.0 &&
      MediaQuery.sizeOf(this).width > 500.0;

  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1024.0;

  bool get isSmall =>
      MediaQuery.sizeOf(this).width < 850.0 &&
      MediaQuery.sizeOf(this).width >= 560.0;

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  Size get size => MediaQuery.sizeOf(this);

  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;

}

extension BuildContextThemeExtension<T> on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get cardColor => Theme.of(this).cardColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get surface => Theme.of(this).colorScheme.surface;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle;

  TextStyle? get bodyExtraSmall =>
      bodySmall?.copyWith(fontSize: 10, height: 1.6, letterSpacing: .5);

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get dividerTextSmall => bodySmall?.copyWith(
      letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle? get dividerTextLarge => bodySmall?.copyWith(
      letterSpacing: 1.5,
      fontWeight: FontWeight.w700,
      fontSize: 13.0,
      height: 1.23);
}

extension NamedNavigationExtension on BuildContext {
  /// Navigate to a named route
  Future<T?> toNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  /// Replace current route with a named route
  Future<T?> toNamedAndOff<T, TO>(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName,
        arguments: arguments);
  }

  /// Replace all existing screens with a named route
  Future<T?> toNamedAndOffAll<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false, // This removes all the previous routes
      arguments: arguments,
    );
  }

  /// Pop to a specific named route in the stack
  void popToNamed(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  /// Pop
  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }

  double get bottomViewInset => MediaQuery.of(this).viewInsets.bottom;

  EdgeInsets get viewInset => MediaQuery.of(this).viewInsets;
}

extension BuildContextEntensionPopup<T> on BuildContext {
  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => Wrap(children: [child]),
    );
  }

  Future<T?> showDialogWidget<T>({
    Widget? child,
    bool barrierDismissible = true,
    Color? barrierColor,
    bool useSafeArea = true,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      builder: (BuildContext context) {
        return Dialog(
          child: child,
        );
      },
    );
  }

  /// [content] is the widget that will be shown in the dialog body if not provided it will show a default text
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message,
      {SnackBarBehavior behavior = SnackBarBehavior.floating,
      Widget? content,
      bool removeCurrentSnackBar = false}) {
    if (removeCurrentSnackBar) {
      ScaffoldMessenger.of(this)
          .removeCurrentSnackBar(reason: SnackBarClosedReason.remove);
    }
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: content ?? Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
// uncomment this if u want when u
// showtoast(message) {
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: primary,
//       // textColor: Colors.white,
//       fontSize: 16.0);
// }
}
