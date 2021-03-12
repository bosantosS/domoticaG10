import 'package:domotica/pages/selectedDevices/bluetooth_page.dart';
import 'package:domotica/pages/selectedDevices/devices_page.dart';
import 'package:domotica/screens/error_screen.dart';
import 'package:domotica/screens/no_connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class SelectedDevice extends StatefulWidget {
  SelectedDevice({Key key}) : super(key: key);

  @override
  _SelectedDeviceState createState() => _SelectedDeviceState();
}

class _SelectedDeviceState extends State<SelectedDevice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _createSelectedDevice(),
    );
  }

  Widget _createSelectedDevice() {
    return FutureBuilder(
      future: FlutterBluetoothSerial.instance.requestEnable(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot != null) {
          ConnectionState state = snapshot.connectionState;
          if (state == ConnectionState.waiting){
            print('***** $state *****');
            return BluetoothPage();
          }else if(state == ConnectionState.done){
            print('***** $state *****');
            return DevicesPage();
          }else{
            print('***** $state *****');
            return NoConnectionScreen();
          }
            
        }
        return ErrorScreen();
      },
    );
  }

  
}
