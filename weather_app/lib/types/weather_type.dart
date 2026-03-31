class WeatherType {
  final String cityName, lastUpdate, icon, conditionWeather;
  final double tempMin, tempMax, tempAvg;
  final int codeImage;
  WeatherType({
    required this.cityName,
    required this.lastUpdate,
    required this.icon,
    required this.tempMin,
    required this.tempMax,
    required this.tempAvg,
    required this.conditionWeather,
    required this.codeImage,
  });

  factory WeatherType.fromJSON(Map<String, dynamic> json) {
    final location = json["location"];
    final currentLocation = json["current"];
    final conditinoCurrent = json["current"]["condition"];
    final dayForcast = json["forecast"]["forecastday"][0]["day"];
    return WeatherType(
      cityName: location["name"],
      lastUpdate: (currentLocation["last_updated"] as String).split(" ")[1],
      icon: conditinoCurrent["icon"],
      conditionWeather: conditinoCurrent["text"],
      codeImage: conditinoCurrent["code"],
      tempMin: dayForcast["mintemp_c"],
      tempMax: dayForcast["maxtemp_c"],
      tempAvg: dayForcast["avgtemp_c"],
    );
  }
}
