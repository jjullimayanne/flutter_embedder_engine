import 'package:car_app/ui/screens/car_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painel Automotivo Digital',
      theme: ThemeData.dark(),
      home: const CarDashboardScreen(),
    );
  }
}
