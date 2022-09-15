import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models.dart';

class DataService{
  Future<WeatherResponse> getWeather(String city) async{

    final queryParameters = {'q' : 'Nukus', 'appid' : '4f9e6a3bedd2e51c200539b265d0f8ef', 'units' : 'metric', 'lang' : 'ru'};

    final uri = Uri.http('api.openweathermap.org', 'data/2.5/weather', queryParameters);

    final response = await http.get(Uri.parse(uri.toString()));

   // print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}

class DataServiceWeek{
  Future<WeatherResponseWeek> getWeatherWeek() async{
    final queryParameters = {'q' : 'Nukus', 'appid' : '4f9e6a3bedd2e51c200539b265d0f8ef', 'units' : 'metric', 'lang' : 'ru', 'cnt' : '1'};

    final uri = Uri.http('api.openweathermap.org', 'data/2.5/forecast', queryParameters);

    final response = await http.get(Uri.parse(uri.toString()));

     //print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponseWeek.fromJson(json);
  }
}

class DataServiceWeekDetails{
  Future<WeatherWeekDetails> getWeatherWeek() async{
    final queryParameters = {'q' : 'Nukus', 'appid' : '4f9e6a3bedd2e51c200539b265d0f8ef', 'units' : 'metric', 'lang' : 'ru', 'cnt' : '8'};

    final uri = Uri.http('api.openweathermap.org', 'data/2.5/forecast', queryParameters);

    final response = await http.get(Uri.parse(uri.toString()));

    //print(response.body);

    final json = jsonDecode(response.body);
    return WeatherWeekDetails.fromJson(json);
  }
}