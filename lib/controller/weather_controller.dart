
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherController{
  Map <String,dynamic> decodedData={};
  Weathermodel? modelobj;

  Future getData() async {
    final url = Uri.parse('https://www.weatherapi.com/docs/');
    final respone = await http.get(url);
    print(respone.statusCode);
    print(respone.body);
    decodedData = jsonDecode(respone.body);
    modelobj = Weathermodel.fromJson(decodedData);

    print(respone.statusCode);
    print(decodedData);

  }
}