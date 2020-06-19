import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestapp/bloc/weather/weather_bloc.dart';
import 'package:fluttertestapp/bloc/weather/weather_event.dart';
import 'package:fluttertestapp/bloc/weather/weather_state.dart';
import 'package:fluttertestapp/screens/widgets/weather_combined_temperature.dart';
import 'package:fluttertestapp/screens/widgets/weather_location.dart';
import 'package:fluttertestapp/utils/colors.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherScreen> {
  WeatherBloc weatherBloc;

  @override
  void didChangeDependencies() {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    weatherBloc.add(FetchWeather());
    return BlocBuilder(
        bloc: weatherBloc,
        builder: (context, state) {
          return Scaffold(
            body: Container(
              child: _weatherBody(context, state),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: AppColors.gradientsColor,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          );
        });
  }

  Widget _weatherBody(context, state) {
    if (state is WeatherLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    if (state is WeatherLoadedError) {
      return Center(
        child: Text('Todo: Error...'),
      );
    }
    return _weatherLoadedState(context, state);
  }

  Widget _weatherLoadedState(context, WeatherLoaded state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: WeatherLocation(location: state.weather.cityName),
          ),
          WeatherCombinedTemperature(
            weather: state.weather,
          )
        ],
      ),
    );
  }
}
