import 'package:flutter/material.dart';

class SplashScene extends StatefulWidget {
  const SplashScene({super.key, required this.onSplashComplete});

  final VoidCallback onSplashComplete;

  @override
  State<SplashScene> createState() => _SplashSceneState();
}

class _SplashSceneState extends State<SplashScene> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.endOfFrame.then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          widget.onSplashComplete();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Theme.of(context).colorScheme.tertiary);
  }
}
