import 'package:flutter/material.dart';
import '../enums/dialog_type.dart';
import 'dialog_config.dart';
import 'dialog_service.dart';

class SmartDialogs {
  /// Initialize SmartDialogs with a [navigatorKey] to allow showing dialogs without BuildContext.
  static void init(GlobalKey<NavigatorState> navigatorKey) {
    DialogService.init(navigatorKey);
  }

  /// Show a success dialog
  static Future<void> success({
    required String title,
    required String message,
    DialogConfig? config,
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return DialogService.show(
      title: title,
      message: message,
      type: DialogType.success,
      config: config,
      confirmText: confirmText,
      onConfirm: onConfirm,
    );
  }

  /// Show an error dialog
  static Future<void> error({
    required String title,
    required String message,
    DialogConfig? config,
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return DialogService.show(
      title: title,
      message: message,
      type: DialogType.error,
      config: config,
      confirmText: confirmText,
      onConfirm: onConfirm,
    );
  }

  /// Show a warning dialog
  static Future<void> warning({
    required String title,
    required String message,
    DialogConfig? config,
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return DialogService.show(
      title: title,
      message: message,
      type: DialogType.warning,
      config: config,
      confirmText: confirmText,
      onConfirm: onConfirm,
    );
  }

  /// Show an info dialog
  static Future<void> info({
    required String title,
    required String message,
    DialogConfig? config,
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return DialogService.show(
      title: title,
      message: message,
      type: DialogType.info,
      config: config,
      confirmText: confirmText,
      onConfirm: onConfirm,
    );
  }

  /// Show a confirmation dialog
  static Future<bool?> confirm({
    required String title,
    required String message,
    DialogConfig? config,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return DialogService.show<bool>(
      title: title,
      message: message,
      type: DialogType.confirm,
      config: config,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  /// Show a loading dialog
  static void loading({
    String title = 'Loading',
    String message = 'Please wait...',
    DialogConfig? config,
  }) {
    DialogService.show(
      title: title,
      message: message,
      type: DialogType.loading,
      config: config?.copyWith(barrierDismissible: false),
    );
  }

  /// Show a custom dialog
  static Future<T?> show<T>({
    required String title,
    required String message,
    required DialogType type,
    DialogConfig? config,
    Widget? customWidget,
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return DialogService.show<T>(
      title: title,
      message: message,
      type: type,
      config: config,
      customWidget: customWidget,
      confirmText: confirmText,
      onConfirm: onConfirm,
    );
  }

  /// Dismiss the current dialog
  static void hide() {
    DialogService.hide();
  }
}
