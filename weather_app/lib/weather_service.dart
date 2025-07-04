import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String _apiKey =
      'edbbea25892180b831e18c9e6f17a283'; // 🔁 Replace with your key
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Weather.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data.');
    }
  }
}
