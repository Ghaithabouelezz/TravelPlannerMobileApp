import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(const TravelPlannerApp());

class TravelPlannerApp extends StatelessWidget {
  const TravelPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Planner',
      home: HomePage(),
    );
  }
}