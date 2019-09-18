import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]): super(props);
}

//The only event in this app is for getting the master
class GetWeather extends WeatherEvent {
  final String cityName;

  //Equatable allows for a simple value equality in Dart
  //All you need to do is pass the class fields to the super constructor
   GetWeather(this.cityName) : super([cityName]);

    //The file is generated with an abstract class WeatherEvent which extends
    // Equatable for making value equality possible without all the hassle.
    // All of the app-specific events have to extend this abstract base class.
}