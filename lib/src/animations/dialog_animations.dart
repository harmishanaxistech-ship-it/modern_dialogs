import 'package:flutter/material.dart';
import '../enums/animation_type.dart';

class DialogAnimations {
  static Widget buildAnimation({
    required AnimationType type,
    required Animation<double> animation,
    required Widget child,
  }) {
    switch (type) {
      case AnimationType.fade:
        return FadeTransition(opacity: animation, child: child);
      case AnimationType.scale:
        return ScaleTransition(scale: animation, child: child);
      case AnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case AnimationType.bounce:
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
          ),
          child: child,
        );
    }
  }
}
