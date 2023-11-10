// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome
    .setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(const MainApp());
    });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(children: [
              Spacer(),
              WeatherView(),
              Expanded(child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 80)),
                  ButtonArea()
                ])
              ),
            ])
          ),
        ),
      ),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      AspectRatio(
        aspectRatio: 1, 
        child: Placeholder()
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: TempertureView()
      )
    ]);
  }
}

class TempertureView extends StatelessWidget {
  const TempertureView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.labelLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '** ℃', 
          style: theme?.copyWith(color: Colors.blue)
        ),
        Text(
          '** ℃', 
          style: theme?.copyWith(color: Colors.red)
        ),
      ]
    );
  }
}

class ButtonArea extends StatelessWidget {
  const ButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(onPressed: () {}, child: const Text('Close')),
        TextButton(onPressed: () {}, child: const Text('Reload')),
      ],
    );
  }
}
