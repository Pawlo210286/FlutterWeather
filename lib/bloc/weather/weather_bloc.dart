import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestapp/bloc/weather/weather_event.dart';
import 'package:fluttertestapp/bloc/weather/weather_state.dart';
import 'package:fluttertestapp/models/weather.dart';
import 'package:fluttertestapp/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({this.weatherRepository}) : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherLoading();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield* _mapFetchWeatherToState();
    }
  }

  Stream<WeatherState> _mapFetchWeatherToState() async* {
    yield WeatherLoading();
    try {
      final Weather weather = await weatherRepository.getWeather();
      yield WeatherLoaded(weather: weather);
    } catch (_) {
      yield WeatherLoadedError();
    }
  }
}
