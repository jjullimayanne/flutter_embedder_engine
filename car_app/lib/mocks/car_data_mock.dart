import 'dart:math';

class CarDataMock {
  static Map<String, dynamic> generateData(int tick) {
    final random = Random();

    return {
      'speed': random.nextInt(220),
      'fuel': max(0, 100 - tick),
      'alerts': {
        'doorOpen': tick % 15 == 0,
        'lowFuel': (100 - tick) < 15,
      },
    };
  }
}
