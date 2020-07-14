import 'package:http/http.dart' as http;
import 'dart:convert';

class IotServices{
  Future<String> getTemp()async{
    String url = "https://node-red-vwdnh.eu-gb.mybluemix.net/data";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    int temp= values["temperature"];
    if(temp<=37) {
      print("The current temperature scanned by IOT temperature sensor is $temp°C");
      print("Fit to travel");
      return "$temp °C - Fit to travel";
    }
    else{
      print("The current temperature scanned by IOT temperature sensor is $temp°C");
      print("Not safe to travel");
      return "$temp °C - Not safe to travel";
    }
  }
}