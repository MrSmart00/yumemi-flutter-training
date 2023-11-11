import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/network.dart';
import 'package:flutter_training/weather.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MainApp(
        network: StubNetwork(),
      ),
    );
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.network});

  final Network network;

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
            child: ContentView(network: network),
          ),
        ),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({super.key, required this.network});

  final Network network;

  @override
  ContentViewState createState() => ContentViewState();
}

class ContentViewState extends State<ContentView> {
  Weather? _weather;

  void setWeather(Weather weather) {
    setState(() {
      _weather = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        WeatherView(weather: _weather),
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
                      setWeather(widget.network.fetchWeather());
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
    this.weather,
  });

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weather == null
              ? const Placeholder()
              : SvgPicture.asset(weather!.fileName.filePath),
        ),
        const Padding(
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
