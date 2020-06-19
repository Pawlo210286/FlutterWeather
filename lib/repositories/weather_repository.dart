import 'package:flutter/cupertino.dart';
import 'package:fluttertestapp/api/weather_api.dart';
import 'package:fluttertestapp/models/weather.dart';

class WeatherRepository {
  static const _locationId = 2487956; // - San Francisco
  static const _cityName = "San Francisco";

  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather() async {
    return weatherApiClient.fetchWeather(_locationId, _cityName);
  }
}
