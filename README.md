# Modern Animated Dialogs

A production-ready Flutter package for showing beautiful, animated, and highly customizable dialogs.

## Features

- 🚀 **Easy to use**: Show dialogs with a single line of code.
- 🎨 **Beautiful UI**: Modern design with rounded corners and shadow effects.
- 🎭 **Animations**: Built-in support for Fade, Scale, Slide, and Bounce animations.
- 🛠️ **Customizable**: Control colors, icons, border radius, padding, and more.
- 📱 **Responsive**: Works perfectly on all screen sizes.
- 🌓 **Theme Support**: Automatically adapts to light and dark themes.
- 🔗 **Global Access**: Show dialogs without `BuildContext` using `navigatorKey`.

## Installation

Add `modern_animated_dialogs` to your `pubspec.yaml`:

```yaml
dependencies:
  modern_animated_dialogs: ^1.0.2
```

## Getting Started

### 1. Initialize with NavigatorKey

To show dialogs without `BuildContext`, initialize `SmartDialogs` with your `navigatorKey`.

```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize SmartDialogs
    SmartDialogs.init(navigatorKey);

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: HomePage(),
    );
  }
}
```

## Usage

### Success Dialog
```dart
SmartDialogs.success(
  title: "Success",
  message: "Payment completed successfully",
);
```

### Error Dialog
```dart
SmartDialogs.error(
  title: "Error",
  message: "Something went wrong",
);
```

### Confirmation Dialog
```dart
final result = await SmartDialogs.confirm(
  title: "Delete Account",
  message: "Are you sure you want to delete your account?",
  confirmText: "Delete",
  cancelText: "Keep it",
);

if (result == true) {
  // Handle deletion
}
```

### Loading Dialog
```dart
SmartDialogs.loading(message: "Uploading...");
// To hide:
SmartDialogs.hide();
```

### Customization

You can pass a `DialogConfig` to any dialog to customize its appearance:

```dart
SmartDialogs.info(
  title: "Customized",
  message: "This is a custom info dialog",
  config: DialogConfig(
    backgroundColor: Colors.blueGrey[900],
    titleColor: Colors.white,
    messageColor: Colors.white70,
    borderRadius: 30,
    animationType: AnimationType.bounce,
    useBlur: true,
  ),
);
```

## Animation Types

- `AnimationType.fade`
- `AnimationType.scale`
- `AnimationType.slide`
- `AnimationType.bounce`

## License

This project is licensed under the MIT License.
