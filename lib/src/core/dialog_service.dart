import 'package:flutter/material.dart';
import '../enums/dialog_type.dart';
import '../widgets/animated_dialog.dart';
import '../widgets/dialog_button.dart';
import '../widgets/loading_dialog.dart';
import '../utils/dialog_helper.dart';
import 'dialog_config.dart';

class DialogService {
  static GlobalKey<NavigatorState>? _navigatorKey;

  static void init(GlobalKey<NavigatorState> key) {
    _navigatorKey = key;
  }

  static BuildContext get _context {
    if (_navigatorKey?.currentState?.context == null) {
      throw Exception(
          'SmartDialogs not initialized. Call SmartDialogs.init(navigatorKey) first.');
    }
    return _navigatorKey!.currentState!.context;
  }

  static Future<T?> show<T>({
    required String title,
    required String message,
    DialogType type = DialogType.info,
    DialogConfig? config,
    Widget? customWidget,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    final dialogConfig = config ?? const DialogConfig();
    
    return Navigator.of(_context).push<T>(
      AnimatedDialog.createRoute<T>(
        config: dialogConfig,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (type != DialogType.custom && type != DialogType.loading) ...[
              Icon(
                DialogHelper.getIcon(type),
                size: 64,
                color: DialogHelper.getColor(type),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: dialogConfig.titleColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: dialogConfig.messageColor ?? Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            if (type == DialogType.loading) ...[
              const SizedBox(height: 24),
              const LoadingDialog(),
            ],
            if (customWidget != null) ...[
              const SizedBox(height: 24),
              customWidget,
            ],
            const SizedBox(height: 24),
            _buildButtons(
              type: type,
              confirmText: confirmText,
              cancelText: cancelText,
              onConfirm: onConfirm,
              onCancel: onCancel,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildButtons({
    required DialogType type,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    final context = _context;
    
    if (type == DialogType.loading) return const SizedBox.shrink();

    if (type == DialogType.confirm) {
      return Row(
        children: [
          Expanded(
            child: DialogButton(
              text: cancelText ?? 'Cancel',
              isOutlined: true,
              onPressed: () {
                Navigator.of(context).pop(false);
                onCancel?.call();
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DialogButton(
              text: confirmText ?? 'Confirm',
              onPressed: () {
                Navigator.of(context).pop(true);
                onConfirm?.call();
              },
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      child: DialogButton(
        text: confirmText ?? 'OK',
        onPressed: () {
          Navigator.of(context).pop(true);
          onConfirm?.call();
        },
      ),
    );
  }

  static void hide() {
    Navigator.of(_context).pop();
  }
}
