class Weather {
  Weather({required this.fileName});

  final WeatherFileName fileName;
}

enum WeatherFileName {
  sunny,
  cloudy,
  rainy,
}

extension WeatherFileNameExtension on WeatherFileName {
  static final names = {
    WeatherFileName.sunny: 'sunny',
    WeatherFileName.cloudy: 'cloudy',
    WeatherFileName.rainy: 'rainy',
  };

  String get filePath => 'assets/${names[this]!}.svg';
}
