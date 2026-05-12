import 'package:flutter/material.dart';
import 'package:modern_dialogs/modern_dialogs.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SmartDialogs
    SmartDialogs.init(navigatorKey);

    return MaterialApp(
      title: 'Modern Dialogs Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern Dialogs Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
              title: 'Basic Dialogs',
              children: [
                _DemoButton(
                  text: 'Success Dialog',
                  color: Colors.green,
                  onPressed: () => SmartDialogs.success(
                    title: 'Success',
                    message: 'Action completed successfully!',
                  ),
                ),
                _DemoButton(
                  text: 'Error Dialog',
                  color: Colors.red,
                  onPressed: () => SmartDialogs.error(
                    title: 'Error',
                    message: 'Something went wrong. Please try again.',
                  ),
                ),
                _DemoButton(
                  text: 'Warning Dialog',
                  color: Colors.orange,
                  onPressed: () => SmartDialogs.warning(
                    title: 'Warning',
                    message: 'This action cannot be undone.',
                  ),
                ),
                _DemoButton(
                  text: 'Info Dialog',
                  color: Colors.blue,
                  onPressed: () => SmartDialogs.info(
                    title: 'Information',
                    message: 'New updates are available.',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Advanced Dialogs',
              children: [
                _DemoButton(
                  text: 'Confirmation Dialog',
                  color: Colors.teal,
                  onPressed: () async {
                    final result = await SmartDialogs.confirm(
                      title: 'Delete Item',
                      message: 'Are you sure you want to delete this item?',
                      confirmText: 'Delete',
                    );
                    if (result == true && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item deleted!')),
                      );
                    }
                  },
                ),
                _DemoButton(
                  text: 'Loading Dialog',
                  color: Colors.purple,
                  onPressed: () {
                    SmartDialogs.loading(message: 'Processing...');
                    Future.delayed(const Duration(seconds: 3), () {
                      SmartDialogs.hide();
                    });
                  },
                ),
                _DemoButton(
                  text: 'Custom Dialog',
                  color: Colors.brown,
                  onPressed: () => SmartDialogs.show(
                    title: 'Custom UI',
                    message: 'This is a custom dialog with a widget.',
                    type: DialogType.custom,
                    customWidget: const Card(
                      color: Colors.amberAccent,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('I am a custom widget!'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Animations',
              children: [
                _DemoButton(
                  text: 'Bounce Animation',
                  color: Colors.indigo,
                  onPressed: () => SmartDialogs.info(
                    title: 'Bounce',
                    message: 'Check out this smooth animation!',
                    config: const DialogConfig(
                      animationType: AnimationType.bounce,
                      animationDuration: Duration(milliseconds: 1000),
                    ),
                  ),
                ),
                _DemoButton(
                  text: 'Slide Animation',
                  color: Colors.pink,
                  onPressed: () => SmartDialogs.info(
                    title: 'Slide',
                    message: 'Sliding from the bottom!',
                    config: const DialogConfig(
                      animationType: AnimationType.slide,
                    ),
                  ),
                ),
                _DemoButton(
                  text: 'Fade Animation',
                  color: Colors.grey[700]!,
                  onPressed: () => SmartDialogs.info(
                    title: 'Fade',
                    message: 'A subtle fade transition.',
                    config: const DialogConfig(
                      animationType: AnimationType.fade,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: 'Special Effects',
              children: [
                _DemoButton(
                  text: 'Blur Background',
                  color: Colors.blueGrey,
                  onPressed: () => SmartDialogs.success(
                    title: 'Blurry!',
                    message: 'The background is now blurred.',
                    config: const DialogConfig(
                      useBlur: true,
                      blurSigma: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...children,
      ],
    );
  }
}

class _DemoButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const _DemoButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
