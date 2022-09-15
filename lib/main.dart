import 'package:flutter/material.dart';
import 'package:weather/data_service.dart';
import 'package:weather/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  _cityTextController = TextEditingController();
  final _dataService = DataService();
  final _dataServiceWeek = DataServiceWeek();
  final _dataServiceWeelDetails = DataServiceWeekDetails();

  WeatherResponse? _response;
  WeatherResponseWeek? _responseWeek;
  WeatherWeekDetails? _responseWeekDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if (_response != null)
              Column(
                children: [
                  Text('${_response?.cityName}'),
                  Text('${_response?.tempInfo.temperature.toInt()}°', style: TextStyle(fontSize: 40),),
                  Text('${_response?.weatherInfo.description}'),
                  Text('${_responseWeek?.cityInfo.city}'),
                  Text('${_responseWeek?.cityInfo.city}'),

                ],
              ),


            Text('${_responseWeekDetails?.listW?.length}'),

            FutureBuilder<Object>(
                future: _dataServiceWeelDetails.getWeatherWeek(),
                builder: (BuildContext context,snapshot){
                  switch (snapshot.connectionState){
                    case ConnectionState.none : return Center(child: Text('Подключение отсутствует'),);
                    case ConnectionState.waiting : return CircularProgressIndicator();
                    case ConnectionState.done :
                      return Container(
                        height: 250,
                        child: ListView.builder(
                          itemCount: _responseWeekDetails?.listW?.length,
                          itemBuilder: (BuildContext context, index)=>
                              Text('${_responseWeekDetails?.listW?[index].weather?[0].description}'),
                        ),
                      );
                    default : return Center();
                  }
                }

            ),

          ],
        ),
      ),
    );
  }

  void _search() async {
   final response = await _dataService.getWeather(_cityTextController.text);
   final responseWeek = await _dataServiceWeek.getWeatherWeek();
   final responseWeekDetails = await _dataServiceWeelDetails.getWeatherWeek();
   setState(() {
     _responseWeekDetails = responseWeekDetails;
     _responseWeek = responseWeek;
     _response = response;

     //print(_dataServiceWeek.getWeatherWeek());
     print(_responseWeek?.cityInfo.city);
   });
  }
}

