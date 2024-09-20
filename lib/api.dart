import 'dart:convert';

import 'weathermodel.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future<ApiResponse> getCurrentWeather(String location) async{
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";
    try{
      final response = await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        return ApiResponse.fromJson(jsonDecode(response.body));
      }else{
        throw Exception("Failed to load");
      }
    }
    catch(e){
      throw Exception("Failed to load");
    }
  }
}