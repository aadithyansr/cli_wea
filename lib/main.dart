import 'package:cli_wea/screens/home.dart';
import 'package:cli_wea/services/location_p.dart';
import 'package:cli_wea/services/weather_servP.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => WeatherServiceProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent, elevation: 0),
            iconTheme: const IconThemeData(color: Colors.white),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
