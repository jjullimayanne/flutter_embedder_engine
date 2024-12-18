import 'package:flutter/material.dart';

class SpeedometerWidget extends StatelessWidget {
  final int speed;

  const SpeedometerWidget({Key? key, required this.speed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Velocidade',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Text(
          '$speed km/h',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
