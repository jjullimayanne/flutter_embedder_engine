import 'dart:isolate';

import 'package:car_app/utils/simulate.dart';
import 'package:flutter/material.dart';

class CarDashboardViewModel extends ChangeNotifier {
  Map<String, dynamic> _carData = {
    'speed': 0,
    'fuel': 100,
    'alerts': {'doorOpen': false, 'lowFuel': false},
  };

  Map<String, dynamic> get carData => _carData;

  late ReceivePort _receivePort;

  CarDashboardViewModel() {
    _startSimulation();
  }

  void _startSimulation() async {
    _receivePort = ReceivePort();
    await Isolate.spawn(carDataSimulator, _receivePort.sendPort);

    _receivePort.listen((data) {
      _carData = data;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _receivePort.close();
    super.dispose();
  }
}
