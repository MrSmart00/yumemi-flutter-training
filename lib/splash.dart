import 'package:flutter/material.dart';

class SplashScene extends StatelessWidget {
  const SplashScene({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Theme.of(context).colorScheme.tertiary);
  }
}
