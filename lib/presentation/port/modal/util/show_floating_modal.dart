import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';

Future<T?> showFloatingModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  Color? barrierColor,
  bool bounce = false,
  bool expand = false,
  AnimationController? secondAnimation,
  Curve? animationCurve,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Duration? duration,
}) =>
    showCustomModalBottomSheet<T>(
      context: context,
      builder: builder,
      containerWidget: (_, __, child) => _FloatingModal(child: child),
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      bounce: bounce,
      expand: expand,
      secondAnimation: secondAnimation,
      animationCurve: animationCurve,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      duration: duration,
    );

class _FloatingModal extends StatelessWidget {
  const _FloatingModal({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding24, vertical: Dimens.padding24),
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(16),
            child: child,
          ),
        ),
      );
}
