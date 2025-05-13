import 'package:flutter/widgets.dart';
import 'package:google_maps_in_flutter/map/searchMap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SearchScreen();
  }
}
