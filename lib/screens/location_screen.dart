import 'package:flutter/material.dart';
import 'package:cluld/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temprature;
  String? message;
  String? weatherIcon;
  String? cityName;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherDate) {
    setState(() {
      if (weatherDate == null) {
        temprature = 0;
        weatherIcon = 'Error';
        message = "Unable to get weather data";
        cityName = '';
        return;
      }
      double temp = weatherDate['main']['temp'];
      temprature = temp.toInt();
      message = weatherModel.getMessage(temprature!);
      var condition = weatherDate['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition!);
      cityName = weatherDate['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.teal.shade900),
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.teal.shade900),
                    onPressed: () async {
                      var typeName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typeName != null) {
                        var weather =
                            await weatherModel.getCityWeather(typeName!);
                        updateUI(weather);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: const TextStyle(
                        fontFamily: 'Spartan MB',
                        // fontWeight: FontWeight.bold,
                        fontSize: 100.0,
                      ),
                    ),
                    Text(
                      "$weatherIcon",
                      style: const TextStyle(
                        fontSize: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'Spartan MB',
                    fontSize: 60.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
