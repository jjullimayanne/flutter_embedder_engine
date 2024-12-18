import 'dart:async';
import 'dart:isolate';
import 'package:car_app/mocks/car_data_mock.dart';


void carDataSimulator(SendPort sendPort) {
  int tick = 0;

  Timer.periodic(const Duration(seconds: 1), (timer) {
    tick++;
    final data = CarDataMock.generateData(tick);
    sendPort.send(data);

    if (data['fuel'] == 0) {
      timer.cancel();
    }
  });
}
