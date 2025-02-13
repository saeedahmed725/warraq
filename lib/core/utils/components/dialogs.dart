import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warraq/core/constants/app_color.dart';
import 'package:warraq/core/shared/arabic_responsive_text.dart';
import 'package:warraq/core/utils/extension/extension.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

enum DialogType {
  loading,
  error,
  success,
  customize,
}

class Dialogs {
  /// Make sure to call [close] after the loading is done

  static Future<T?> show<T>(
    BuildContext context,
    Widget child, {
    bool useSafeArea = true,
    Color? barrierColor,
    bool barrierDismissible = true,
    Offset? anchorPoint,
    String? barrierLabel,
    RouteSettings? routeSettings,
    bool useRootNavigator = true,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) {
    return showDialog<T>(
      context: context,
      useSafeArea: useSafeArea,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      routeSettings: routeSettings,
      traversalEdgeBehavior: traversalEdgeBehavior,
      useRootNavigator: useRootNavigator,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }

  static void showYesNoDialog(
    BuildContext context, {
    Widget? title,
    Widget? message,
    Function()? onYes,
    Function()? onNo,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: message,
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.only(bottom: 16),
          actions: [
            10.heightGap,
            SizedBox(
              width: context.width,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.secondaryContainer),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                  onNo?.call();
                },
                child:
                    Text('No', style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            SizedBox(
              width: context.width,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.secondaryContainer),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                  onYes?.call();
                },
                child:
                    Text('Yes', style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<T?> showSuccess<T>(
    BuildContext context, {
    Widget? child,
    String? message,
    bool useSafeArea = true,
    Color? barrierColor,
    bool barrierDismissible = true,
    Offset? anchorPoint,
    String? barrierLabel,
    RouteSettings? routeSettings,
    bool useRootNavigator = true,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      routeSettings: routeSettings,
      traversalEdgeBehavior: traversalEdgeBehavior,
      useRootNavigator: useRootNavigator,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 50),
            20.heightGap,
            ResponsiveText(text: message ?? 'Success'),
            if (child != null) child
          ],
        ),
      ),
    );
  }

  static Future<T?> showError<T>(
    BuildContext context, {
    Widget? child,
    String? message,
    bool useSafeArea = true,
    Color? barrierColor,
    bool barrierDismissible = true,
    Offset? anchorPoint,
    String? barrierLabel,
    RouteSettings? routeSettings,
    bool useRootNavigator = true,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      anchorPoint: anchorPoint,
      barrierLabel: barrierLabel,
      routeSettings: routeSettings,
      traversalEdgeBehavior: traversalEdgeBehavior,
      useRootNavigator: useRootNavigator,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 50),
            20.heightGap,
            ResponsiveText(text: message ?? 'Error'),
            if (child != null) child
          ],
        ),
      ),
    );
  }
}

@immutable
class LoadingController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingController({
    required this.close,
    required this.update,
  });
}

class LoadingDialog {
  LoadingDialog._internal();

  static final LoadingDialog _instance = LoadingDialog._internal();

  factory LoadingDialog() => _instance;

  static LoadingController? _controller;

  /// Displays the loading dialog. If already visible, updates the displayed text.
  static void show({
    required BuildContext context,
    String text = "Loading",
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    }
    _controller = _showOverlay(context: context, text: text);
  }

  /// Hides the loading dialog.
  static void hide() {
    _controller?.close();
    _controller = null;
  }

  /// Internal method to display the overlay.
  static LoadingController? _showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final textController = StreamController<String>.broadcast();
    textController.add(text);

    final overlayState = Overlay.of(context);

    final size = MediaQuery.of(context).size;

    final overlay = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.8,
              maxHeight: size.height * 0.4,
              minWidth: size.width * 0.5,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColor.kPrimaryColor),
                ),
                const SizedBox(height: 16),
                StreamBuilder<String>(
                  stream: textController.stream,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlay);

    return LoadingController(
      close: () {
        textController.close();
        overlay.remove();
        return true;
      },
      update: (newText) {
        textController.add(newText);
        return true;
      },
    );
  }
}
