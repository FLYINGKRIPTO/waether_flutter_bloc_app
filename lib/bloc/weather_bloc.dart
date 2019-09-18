import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:waether_flutter_bloc_app/model/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState> {

  @override
  WeatherState get initialState => WeatherInitial();

  //Under the hood the Bloc library works with regular Dart Streams
  //The *async* makes this method an async generator, which outputs a stream

  @override
  Stream<WeatherState>  mapEventToState(
      WeatherEvent event,
      ) async* {

    //Distinguish between different activities
    //Even though this app has only one
    if(event is GetWeather) {
      yield WeatherLoading();
      final weather = await _fetchWeatherFromFakeApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName){
    //simulate network delay

    return Future.delayed(
      Duration(seconds: 1),
        ( ){
           return Weather(
             cityName: cityName,
             temperature: 20 + Random().nextInt(15) + Random().nextDouble(),

           );
        }
    );
  }

}