import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_flutter_bloc_app/bloc/bloc.dart';
import 'package:waether_flutter_bloc_app/model/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  WeatherPage({Key key}) : super(key: key);
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherBloc  = WeatherBloc();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Fake Weather App"),
      ),
      body: Container(

        child: BlocBuilder(
          bloc: weatherBloc,
          builder: (BuildContext context,WeatherState state){
            if(state is WeatherInitial){
              return buildInitialInput();
            }
            else if(state is WeatherLoading){
              return buildLoading();
            }
            else if(state is WeatherLoaded){
              return buildColumnWithData(state.weather);
            }
          },

        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );

  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );

  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,

          ),
        ),
        Text(
          "${weather.temperature.toStringAsFixed(1)} C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),

      ],
    );
  }
  @override
  void dispose() {

    weatherBloc.dispose();
  }
}

class CityInputField extends StatefulWidget {
  @override
    _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
          onSubmitted: submitCityName,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: "Enter a city",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(Icons.search),
          ),
      ),
    );
  }

  void submitCityName(String value) {
  }
}


