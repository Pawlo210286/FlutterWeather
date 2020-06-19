import 'package:flutter/material.dart';
import 'package:fluttertestapp/models/weather.dart';
import 'package:fluttertestapp/screens/widgets/weather_conditions.dart';
import 'package:fluttertestapp/screens/widgets/weather_temperature.dart';

class WeatherCombinedTemperature extends StatelessWidget {
  final Weather weather;

  WeatherCombinedTemperature({
    Key key,
    @required this.weather,
  })
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(30.0),
          child: WeatherConditions(condition: weather.condition),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Temperature(
              temperature: weather.temp))
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
