import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final Map<String, bool> alerts;

  const AlertWidget({Key? key, required this.alerts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> alertMessages = [];

    if (alerts['lowFuel'] ?? false) {
      alertMessages.add(_buildAlert('⚠️ Alerta: Tanque Baixo'));
    }
    if (alerts['doorOpen'] ?? false) {
      alertMessages.add(_buildAlert('⚠️ Alerta: Porta Aberta'));
    }

    return Column(
      children: alertMessages,
    );
  }

  Widget _buildAlert(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: const TextStyle(fontSize: 20, color: Colors.red),
      ),
    );
  }
}
