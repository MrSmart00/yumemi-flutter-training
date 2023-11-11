import 'package:yumemi_weather/yumemi_weather.dart';

abstract class Network {
  String fetchWeather();
}

class StubNetwork extends Network {
  final YumemiWeather yumemiWeather = YumemiWeather();

  @override
  String fetchWeather() {
    return yumemiWeather.fetchSimpleWeather();
  }
}
