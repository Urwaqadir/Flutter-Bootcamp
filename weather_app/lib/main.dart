import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_service.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController(
    text: "London",
  );
  Weather? _weather;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _getWeather(); // Load default city weather on startup
  }

  void _getWeather() async {
    final city = _controller.text.trim();
    if (city.isEmpty) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final weather = await WeatherService.fetchWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _weather = null;
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget weatherTile({
    required IconData icon,
    required String title,
    required String value,
    String? subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 30),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 20)),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.white60),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weather = _weather;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter City Name",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _getWeather,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                  child: const Text("Search"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_loading)
              const CircularProgressIndicator()
            else if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red))
            else
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    weatherTile(
                      icon: Icons.air,
                      title: "Wind",
                      value: "${weather?.windSpeed ?? '--'} m/s",
                      subtitle: "Measured at surface",
                    ),
                    weatherTile(
                      icon: Icons.thermostat_outlined,
                      title: "Feels Like",
                      value:
                          "${weather?.feelsLike.toStringAsFixed(1) ?? '--'}°C",
                      subtitle: "Feels temperature",
                    ),
                    weatherTile(
                      icon: Icons.water_drop,
                      title: "Humidity",
                      value: "${weather?.humidity ?? '--'}%",
                      subtitle: "Humidity level",
                    ),
                    weatherTile(
                      icon: Icons.remove_red_eye_outlined,
                      title: "Visibility",
                      value: "${(weather?.visibility ?? 0) / 1000} km",
                      subtitle: "Surface visibility",
                    ),
                    weatherTile(
                      icon: Icons.speed,
                      title: "Pressure",
                      value: "${weather?.pressure ?? '--'} hPa",
                      subtitle: "Sea level pressure",
                    ),
                    weatherTile(
                      icon: Icons.cloud,
                      title: "Precipitation",
                      value: "6 mm",
                      subtitle: "Forecasted (mocked)",
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
