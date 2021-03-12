import 'package:flutter/material.dart';

/* ThemeData
Centralizar todas las decisiones esteticas en un solo lugar.
Nos garantiza un codigo sin repetidos, ordenado, legible y facil de mantener.
*/

// Uso del mixin ChangeNotifier
class CustomTheme with ChangeNotifier {
  //ThemeData, comtiene todo lo referente a style

  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  bool toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
    return _isDarkTheme;
  }

  bool get isDark{return _isDarkTheme;}
  
  Color get primaryColorTheme {
    return _isDarkTheme ? ColorDark.primary : ColorLight.primary;
  }

  Color get secundaryColorTheme {
    return _isDarkTheme ? ColorDark.secundary : ColorLight.secundary;
  }

  Color get warningColorTheme {
    return _isDarkTheme ? ColorDark.warning : ColorLight.warning;
  }

  Color get cancelColorTheme {
    return _isDarkTheme ? ColorDark.cancel : ColorLight.cancel;
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ColorLight.primary,
      accentColor: ColorLight.secundary,
      scaffoldBackgroundColor: ColorLight.primary,
      errorColor: ColorLight.warning,
      indicatorColor: ColorLight.secundary,
      fontFamily: "Montserrat",
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: ColorDark.primary,
      accentColor: ColorDark.secundary,
      scaffoldBackgroundColor: ColorDark.primary,
      errorColor: ColorDark.warning,
      indicatorColor: ColorDark.cancel,
      fontFamily: "Montserrat",
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      ),
    );
  }
}

// https://colorhunt.co/palette/220330
class ColorLight {
  static Color primary = const Color(0xff16a596);
  static Color secundary = const Color(0xff898b8a);
  static Color cancel = const Color(0xfffae0df);
  static Color warning = const Color(0xfff6f5f1);
}
//https://colorhunt.co/palette/252793
class ColorDark {
  static Color secundary = const Color(0xff0a043c);
  static Color cancel = const Color(0xff03506f);
  static Color warning = const Color(0xffa3ddcb);
  static Color primary = const Color(0xff000000);
}

// https://www.raywenderlich.com/16628777-theming-a-flutter-app-getting-started#toc-anchor-002
