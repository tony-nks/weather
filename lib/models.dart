


class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fomJson(Map<String, dynamic> json){
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}



class TemperatureInfo{
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json){
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}


class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;



  WeatherResponse({required this.cityName, required this.tempInfo, required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];
    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);
    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fomJson(weatherInfoJson);
    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}


//------------------------------------------------------------------------

class CityInfo{
  final String city;

  CityInfo({required this.city});

  factory CityInfo.fromJson(Map<String, dynamic> json){
    final city = json['name'];
    return CityInfo(city: city);
  }
}



class WeatherResponseWeek {
  final CityInfo cityInfo;


  WeatherResponseWeek({required this.cityInfo});
  factory WeatherResponseWeek.fromJson(Map<String, dynamic> json){
    final cityInfoJson = json['city'];
    final cityName = CityInfo.fromJson(cityInfoJson);
    return WeatherResponseWeek(cityInfo: cityName);

  }
}









class WeatherWeekDetails {
  List<ListW>? listW;

  WeatherWeekDetails({this.listW});

  WeatherWeekDetails.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      listW = <ListW>[];
      json['list'].forEach((v) {
        listW!.add(ListW.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listW != null) {
      data['listW'] = listW!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListW {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  String? dtTxt;

  ListW(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.dtTxt});

  ListW.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['dt_txt'] = dtTxt;
    return data;
  }
}

class Main {
  double? temp;
  int? humidity;

  Main({this.temp, this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['humidity'] = humidity;
    return data;
  }
}

class Weather {
  String? description;
  String? icon;

  Weather({this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}