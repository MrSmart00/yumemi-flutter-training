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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.red,
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: ContentView(),
          ),
        ),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  ContentViewState createState() => ContentViewState();
}

class ContentViewState extends State<ContentView> {
  final yumemiWeather = YumemiWeather();
  String? _imageName;

  void setImageName(String name) {
    setState(() {
      _imageName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        WeatherView(imageName: _imageName),
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
                      setImageName(result);
                    },
                    child: const Text('Reload'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({
    super.key,
    required this.imageName,
  });

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
