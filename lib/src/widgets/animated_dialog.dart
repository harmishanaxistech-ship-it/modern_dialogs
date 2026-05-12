import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/dialog_config.dart';
import '../animations/dialog_animations.dart';

class AnimatedDialog extends StatelessWidget {
  final Widget child;
  final DialogConfig config;

  const AnimatedDialog({
    super.key,
    required this.child,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    Widget dialogChild = Center(
      child: Container(
        width: config.width,
        height: config.height,
        padding: config.padding,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: config.backgroundColor ?? Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(config.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );

    if (config.useBlur) {
      dialogChild = BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: config.blurSigma,
          sigmaY: config.blurSigma,
        ),
        child: dialogChild,
      );
    }

    return dialogChild;
  }

  static Route<T> createRoute<T>({
    required Widget child,
    required DialogConfig config,
  }) {
    return PageRouteBuilder<T>(
      opaque: false,
      barrierDismissible: config.barrierDismissible,
      barrierColor: config.barrierColor,
      transitionDuration: config.animationDuration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedDialog(
          config: config,
          child: child,
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return DialogAnimations.buildAnimation(
          type: config.animationType,
          animation: animation,
          child: child,
        );
      },
    );
  }
}
