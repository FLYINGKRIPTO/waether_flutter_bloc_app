import 'package:waether_flutter_bloc_app/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherState extends Equatable {
  WeatherState([List props = const[]]): super(props);

}
class WeatherInitial extends WeatherState {
}

class WeatherLoading extends  WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather) : super([weather]);
}