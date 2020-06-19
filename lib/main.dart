import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestapp/api/weather_api.dart';
import 'package:fluttertestapp/bloc/simple_bloc_delegate.dart';
import 'package:fluttertestapp/bloc/weather/weather_bloc.dart';
import 'package:fluttertestapp/repositories/weather_repository.dart';
import 'package:fluttertestapp/screens/weather.dart';
import 'package:fluttertestapp/utils/themes.dart';
import 'package:http/http.dart' as http;

void main() {
  final WeatherApiClient weatherApiClient =
      WeatherApiClient(httpClient: http.Client());
  final WeatherRepository weatherRepository =
      WeatherRepository(weatherApiClient: weatherApiClient);

  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(WeatherApp(weatherRepository: weatherRepository));
}

class WeatherApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  WeatherApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Demo',
      theme: appTheme,
      home: BlocProvider(
        create: (context) => WeatherBloc(
          weatherRepository: weatherRepository,
        ),
        child: WeatherScreen(),
      ),
    );
  }
}
