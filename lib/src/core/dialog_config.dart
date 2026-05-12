import \u0027package:flutter/material.dart\u0027;
import \u0027../enums/animation_type.dart\u0027;

class DialogConfig {
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? messageColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double? width;
  final double? height;
  final Duration animationDuration;
  final Curve animationCurve;
  final AnimationType animationType;
  final bool barrierDismissible;
  final Color? barrierColor;
  final bool useBlur;
  final double blurSigma;

  const DialogConfig({
    this.backgroundColor,
    this.titleColor,
    this.messageColor,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(24.0),
    this.width,
    this.height,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.animationType = AnimationType.scale,
    this.barrierDismissible = true,
    this.barrierColor = Colors.black54,
    this.useBlur = false,
    this.blurSigma = 5.0,
  });

  DialogConfig copyWith({
    Color? backgroundColor,
    Color? titleColor,
    Color? messageColor,
    double? borderRadius,
    EdgeInsets? padding,
    double? width,
    double? height,
    Duration? animationDuration,
    Curve? animationCurve,
    AnimationType? animationType,
    bool? barrierDismissible,
    Color? barrierColor,
    bool? useBlur,
    double? blurSigma,
  }) {
    return DialogConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleColor: titleColor ?? this.titleColor,
      messageColor: messageColor ?? this.messageColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      width: width ?? this.width,
      height: height ?? this.height,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      animationType: animationType ?? this.animationType,
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      barrierColor: barrierColor ?? this.barrierColor,
      useBlur: useBlur ?? this.useBlur,
      blurSigma: blurSigma ?? this.blurSigma,
    );
  }
}
