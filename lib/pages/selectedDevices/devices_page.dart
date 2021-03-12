import 'package:domotica/pages/home_page.dart';
import 'package:domotica/pages/selectedDevices/selectedBondedDevice_page.dart';
import 'package:domotica/pages/tabs/comunication_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Connection'),
      ),
      body: SelectBondedDevicePage(
        onCahtPage: (device1) {
          BluetoothDevice device = device1;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                //return ChatPage(server: device);
                print(device);
                return HomePage(server: device,);
              },
            ),
          );
        },
      ),
    ));
  }
}