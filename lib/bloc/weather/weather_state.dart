import 'package:fluttertestapp/models/weather.dart';

abstract class WeatherState {
  WeatherState();
}

class WeatherLoading extends WeatherState {}

class WeatherLoadedError extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({this.weather}) : assert(weather != null);
}
