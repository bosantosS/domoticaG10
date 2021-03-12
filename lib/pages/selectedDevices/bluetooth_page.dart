import 'package:flutter/material.dart';

// Waiting Page
class BluetoothPage extends StatelessWidget {
  const BluetoothPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _createWaiting(),
    );
  }

  Widget _createWaiting() {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.bluetooth_disabled,
                size: 200.0,
                color: Colors.blue,
              ),
              Text('Waiting...'),
            ],
          ),
        ),
      ),
    );
  }
}