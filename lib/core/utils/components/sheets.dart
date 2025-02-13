import 'package:flutter/material.dart';
import 'package:warraq/core/shared/arabic_responsive_text.dart';
import 'package:warraq/core/utils/components/dialogs.dart';
import 'package:warraq/core/utils/extension/extension.dart';

class Sheets extends StatefulWidget {
  const Sheets({super.key, this.child});

  final Widget? child;

  @override
  State<Sheets> createState() => _SheetsState();

  static show(
    BuildContext context, {
    required Widget child,
    bool enableDrag = true,
    bool showDragHandle = true,
    Color? backgroundColor,
  }) {
    return _SheetsState().showAppBottomSheet(
      context,
      child: child,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      backgroundColor: backgroundColor,
    );
  }

  static showModel(BuildContext context,
      {required Widget child,
      ShapeBorder? shape,
      Clip? clipBehavior,
      Color? backgroundColor,
      bool showDragHandle = true,
      double? elevation,
      Color? barrierColor,
      bool enableDrag = true,
      BoxConstraints? constraints,
      bool isDismissible = true,
      bool useSafeArea = true,
      bool isScrollControlled = false}) {
    return _SheetsState().showAppModelBottomSheet(
      context,
      child: child,
      shape: shape,
      clipBehavior: clipBehavior,
      backgroundColor: backgroundColor,
      showDragHandle: showDragHandle,
      elevation: elevation,
      barrierColor: barrierColor,
      enableDrag: enableDrag,
      constraints: constraints,
      isDismissible: isDismissible,
      useSafeArea: useSafeArea,
      isScrollControlled: isScrollControlled,
    );
  }
}

class _SheetsState extends State<Sheets> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.35,
      maxChildSize: 1,
      minChildSize: 0.1,
      expand: true,
      snap: true,
      snapSizes: const [0.35],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 6,
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 14.0),
                    child: ResponsiveText(
                      fontSize: 18,
                      text: 'تعديل الحساب',
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: 14.heightGap,
              ),
              SliverToBoxAdapter(
                child: widget.child,
              )
            ],
          ),
        );
      },
    );
  }

  PersistentBottomSheetController showAppBottomSheet(
    BuildContext context, {
    required Widget child,
    bool enableDrag = true,
    bool showDragHandle = true,
    Color? backgroundColor,
  }) {
    return Scaffold.of(context).showBottomSheet(
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 400),
      ),
      (context) => child,
    );
  }

  ///[showAppBottomSheet]
  Future<T?> showAppModelBottomSheet<T>(BuildContext context,
      {required Widget child,
      ShapeBorder? shape,
      Clip? clipBehavior,
      Color? backgroundColor,
      bool showDragHandle = true,
      double? elevation,
      Color? barrierColor,
      bool enableDrag = true,
      BoxConstraints? constraints,
      bool isDismissible = true,
      bool useSafeArea = true,
      bool isScrollControlled = false}) {
    return showModalBottomSheet<T>(
        context: context,
        shape: shape,
        constraints: constraints,
        barrierColor: barrierColor,
        isScrollControlled: isScrollControlled,
        clipBehavior: clipBehavior,
        elevation: elevation,
        transitionAnimationController: AnimationController(
          vsync: Navigator.of(context),
          duration: const Duration(milliseconds: 400),
        ),
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        showDragHandle: showDragHandle,
        useSafeArea: useSafeArea,
        backgroundColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        builder: (context) {
          return child;
        });
  }
}
