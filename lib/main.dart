//Las de otros
import 'package:domotica/pages/home_page.dart';
import 'package:domotica/pages/login/login_page.dart';
import 'package:domotica/pages/selectedDevices/selectedDevices.dart';
import 'package:domotica/screens/error_screen.dart';
import 'package:flutter/material.dart';

//Mis importaciones
import 'package:domotica/theme/config.dart';
import 'package:domotica/theme/custom_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Usando metodos de estado, Ciclo de Vida de un Widget
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {
        print('***** Rebuild el Widget...');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DomoticaG10',
      debugShowCheckedModeBanner: false,
      // Theme for APP
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      // Routes
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'bluetooth': (BuildContext context) => SelectedDevice(),
      },
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        print('La ruta no encontrada es ${settings.name}');
        return MaterialPageRoute(builder: (BuildContext builder) => ErrorScreen());
      },

    );
  }
}
/*
onGenerateRoute: (RouteSettings settings) {
    // Se ejecutará este código si no se encuentra una ruta específica
    // Para saber el nombre de la ruta que se llamo se usa el settings.name
    print('La ruta no encontrada es ${settings.name}');
 */