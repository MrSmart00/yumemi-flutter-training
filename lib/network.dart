import 'package:flutter_training/weather.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

abstract class Network {
  Future<Weather> fetchWeather();
}

class StubNetwork extends Network {
  final YumemiWeather yumemiWeather = YumemiWeather();

  @override
  Future<Weather> fetchWeather() async {
    final result = yumemiWeather.fetchSimpleWeather();
    final fileName = convert(result)!;
    return Future<Weather>.value(Weather(fileName: fileName));
  }

  WeatherFileName? convert(String orgName) {
    switch (orgName) {
      case 'sunny':
        return WeatherFileName.sunny;
      case 'cloudy':
        return WeatherFileName.cloudy;
      case 'rainy':
        return WeatherFileName.rainy;
      default:
        return null;
    }
  }
}
