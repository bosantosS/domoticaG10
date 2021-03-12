import 'package:flutter/material.dart';

class GarageTab extends StatefulWidget {
  //const GarageTab({Key key}) : super(key: key);
  final Function buttonHandler;
  GarageTab(this.buttonHandler);

  @override
  _GarageTabState createState() => _GarageTabState();
}

class _GarageTabState extends State<GarageTab> {
  bool isOpen = false;
  bool isOpenning = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: new Offset(0.0, 20.0),
                        blurRadius: 20.0,
                      ),
                    ]),
                    child: Image.asset(openDoorS())),
                SizedBox(
                  height: 64.0,
                ),
                IconButton(
                  icon: Icon(
                    isOpen ? Icons.lock_outline : Icons.lock_open,
                  ),
                  iconSize: size.width * 0.32,
                  tooltip: isOpen ? 'Close Garage' : 'Open Garage',
                  enableFeedback: true,
                  onPressed: () {
                    print('OPEN');
                    setState(() {
                      isOpen = !isOpen;
                      print(isOpen);
                      widget.buttonHandler(isOpen ? 'm' : 'n');
                    });
                  },
                ),
                Text(isOpen ? 'CLOSE' : 'OPEN'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Widget openDoor() => this.isOpen ? Image.asset('assets/images/openGarage.jpg') : Image.asset('assets/images/closeGarage.jpg');
  String openDoorS() => this.isOpen
      ? 'assets/images/openGarage.jpg'
      : 'assets/images/closeGarage.jpg';
}
