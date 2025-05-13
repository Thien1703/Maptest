import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/Screens/Map/mapScreen.dart';
import 'package:google_maps_in_flutter/map/searchMap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const SearchScreen(),
    );
  }
}
