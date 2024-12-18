import 'package:flutter/material.dart';

class FuelGaugeWidget extends StatelessWidget {
  final int fuelLevel;

  const FuelGaugeWidget({Key? key, required this.fuelLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Combustível',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Text(
          '$fuelLevel%',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: fuelLevel < 15 ? Colors.red : Colors.yellow,
          ),
        ),
      ],
    );
  }
}
