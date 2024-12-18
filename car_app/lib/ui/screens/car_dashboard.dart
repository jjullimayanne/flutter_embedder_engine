import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/car_dashboard_viewmodel.dart';
import '../widgets/alert_widget.dart';
import '../widgets/fuel_gauge_widget.dart';
import '../widgets/media_controls_widget.dart';
import '../widgets/speedometer_widget.dart';

class CarDashboardScreen extends StatelessWidget {
  const CarDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarDashboardViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<CarDashboardViewModel>(
          builder: (context, viewModel, child) {
            final carData = viewModel.carData;

            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpeedometerWidget(speed: carData['speed']),
                  const SizedBox(height: 20),
                  FuelGaugeWidget(fuelLevel: carData['fuel']),
                  const SizedBox(height: 20),
                  AlertWidget(alerts: carData['alerts']),
                  const SizedBox(height: 20),
                  MediaControlsWidget(
                    onPlayPause: () {},
                    onNext: () {},
                    isPlaying: true,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
