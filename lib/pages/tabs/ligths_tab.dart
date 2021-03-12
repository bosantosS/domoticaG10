import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class LigthsTab extends StatefulWidget {
  //const LigthsTab({Key key}) : super(key: key);
  final Function buttonHandler;
  LigthsTab(this.buttonHandler);

  @override
  _LigthsTabState createState() => _LigthsTabState();
}

class _LigthsTabState extends State<LigthsTab> {

  List<Room> rooms = [
    Room('Entrada','Patio frontal',false,'a','b'),
    Room('Comedor','Para comer xD',false,'c','d'),
    Room('Sala','Para descansar y ver TV',false,'e','f'),
    Room('Cuarto1','Para mimir papas',false,'g','h'),
    Room('Cuarto2','Para mimir hermano',false,'i','j'),
    Room('Cuarto3','Para mimir yo',false,'k','l'),

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Container(
          child: Center(
            child:_createRooms()
        ),
      ),
    );
  }

  ListView _createRooms() {
  return ListView.builder(
    itemCount: rooms.length,
    itemBuilder: (BuildContext context, int ind){
      return ListTile(
        leading: rooms[ind].turnOn ? Icon(Icons.lightbulb) : Icon(Icons.lightbulb_outlined),
        title: Text(rooms[ind].room),
        subtitle: Text(rooms[ind].description),
        trailing: Switch(
          value: rooms[ind].turnOn,
          onChanged: (bool value) { 
            setState(() {
                rooms[ind].turnOn = value;
                print(value);
                print(rooms[ind].turnOnOff());
                widget.buttonHandler(rooms[ind].turnOnOff());
                //isConnected ? () => _sendMessage('1') : null,
              });
           }, 
        ),
        onTap: (){
          print('EO');
        },
      );
    },
  );
}
}

class Room {
  String room;
  String description;
  bool turnOn;

  String onAction;//a,c,e,g,i,k
  String offAction;//b,d,f,h,j,l

  Room(
    this.room,this.description,this.turnOn,this.onAction,this.offAction
  );

  String turnOnOff(){
    return this.turnOn ? this.onAction : this.offAction;
  }
}


