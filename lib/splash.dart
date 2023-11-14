import 'package:flutter/material.dart';
import 'package:flutter_training/delay_provider.dart';

class SplashScene extends StatefulWidget {
  const SplashScene({super.key, required this.delayProvider});

  final DelayProvider delayProvider;

  @override
  State<SplashScene> createState() => _SplashSceneState();
}

class _SplashSceneState extends State<SplashScene> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      widget.delayProvider.delay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Theme.of(context).colorScheme.tertiary);
  }
}
