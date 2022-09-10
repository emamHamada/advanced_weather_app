import 'package:flutter/cupertino.dart';


import '../../data/datasources/remote/api.dart';
import '../../data/models/weather_model.dart';

class MainScreenModel extends ChangeNotifier {
  WeatherForecastModel? _forecastObject;
  WeatherForecastModel? get forecastObject => _forecastObject;
  bool _loading = true;

List favorite_places=[];
  List searchList=[];
  bool get loading => _loading;
  String cityName = '';

  MainScreenModel() {
    setup();
  }

  Future<void> setup() async {
    _forecastObject ??=
        await WeatherApi().fetchWeatherForecast(cityName: 'Egypt');
    updateState();
  }

  void onSubmitLocate() async {
    updateState();
    _forecastObject = await WeatherApi().fetchWeatherForecast();
    cityName = _forecastObject!.location!.name!;
    updateState();
  }

  void onSubmitSearch() async {
    if (cityName.isEmpty) return;
    updateState();
    searchList.add(cityName);
    _forecastObject =
        await WeatherApi().fetchWeatherForecast(cityName: cityName);
    cityName = '';

    updateState();
  }
  void onSubmitFavPlace(var placeName) async {
    updateState();
    favorite_places.add(placeName);
    updateState();
  }

  void onDeleteOneFavPlace(var placeName) async {
    updateState();
    favorite_places.removeWhere((item) => item == favorite_places.indexOf(placeName));
    updateState();
  }

  void updateState() {
    _loading = !_loading;

    notifyListeners();
  }
}
