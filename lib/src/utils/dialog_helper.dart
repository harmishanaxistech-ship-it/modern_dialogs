import 'package:flutter/material.dart';
import '../enums/dialog_type.dart';

class DialogHelper {
  static IconData getIcon(DialogType type) {
    switch (type) {
      case DialogType.success:
        return Icons.check_circle_outline;
      case DialogType.error:
        return Icons.error_outline;
      case DialogType.warning:
        return Icons.warning_amber_outlined;
      case DialogType.info:
        return Icons.info_outline;
      case DialogType.confirm:
        return Icons.help_outline;
      default:
        return Icons.info_outline;
    }
  }

  static Color getColor(DialogType type) {
    switch (type) {
      case DialogType.success:
        return Colors.green;
      case DialogType.error:
        return Colors.red;
      case DialogType.warning:
        return Colors.orange;
      case DialogType.info:
        return Colors.blue;
      case DialogType.confirm:
        return Colors.blue;
      default:
        return Colors.blue;
    }
  }
}
