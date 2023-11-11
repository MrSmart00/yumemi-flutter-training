import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final yumemiWeather = YumemiWeather();
  String? imageName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.red,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Column(
              children: [
                const Spacer(),
                WeatherView(imageName: imageName),
                Expanded(
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 80)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              final result = yumemiWeather.fetchSimpleWeather();
                              print(result);
                            },
                            child: const Text('Reload'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key, this.imageName});

  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Placeholder(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: TempertureView(),
        ),
      ],
    );
  }
}

class TempertureView extends StatelessWidget {
  const TempertureView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '** ℃',
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          '** ℃',
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
