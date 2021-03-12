import 'package:flutter/material.dart';

class NoResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/no_results.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Text(
              'Lo siento, no hay resultados. Intenta nuevamente...',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.justify,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: IconButton(
              icon: Icon(
                Icons.help_outline_sharp,
                size: 100,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context,'home');
                print("*** Regresar a una nueva busqueda ***");
              },
            ),
          ),
        ],
      ),
    );
  }
}
