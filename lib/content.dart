import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/network.dart';
import 'package:flutter_training/weather.dart';

class ContentScene extends StatelessWidget {
  const ContentScene({super.key, required this.network});

  final Network network;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: _ContentView(network: network),
        ),
      ),
    );
  }
}

class _ContentView extends StatefulWidget {
  const _ContentView({required this.network});

  final Network network;

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<_ContentView> {
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
        _WeatherView(weather: _weather),
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
                      widget.network.fetchWeather().then(setWeather);
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

class _WeatherView extends StatelessWidget {
  const _WeatherView({
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
          child: _TemperatureView(),
        ),
      ],
    );
  }
}

class _TemperatureView extends StatelessWidget {
  const _TemperatureView();

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
