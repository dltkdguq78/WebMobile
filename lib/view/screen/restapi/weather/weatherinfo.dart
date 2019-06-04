class WeatherInfo {

  final String region;
  final String weather;
  final String tem;
  final String wind;

  WeatherInfo({this.region, this.weather, this.tem, this.wind,});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      region:json['region'],
      weather:json['weather'],
      tem: json['temperture'],
      wind: json['windvelo'],
    );
  }
}