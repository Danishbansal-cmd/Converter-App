import 'package:converter_app/providers/converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode {
    return _themeMode;
  }

  void toogleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  // Provider.of<ConverterProvider>(context,listen: false);
  static ThemeData get lightTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.grey,
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.deepPurple,
          background: Colors.white,
          primaryVariant: Vx.gray200,
          secondary: Colors.black,
          secondaryVariant: Colors.black.withOpacity(0.6),
        ),
        textTheme: const TextTheme(
          // bodyText1: TextStyle(
          //   fontSize: 20,
          //   color: Provider.of<ConverterProvider>(context,listen: false).isSelectedValue1 ? Colors.orange : null,
          // ),
          headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          headline6: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF606060),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          headline6: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF303030),
          background: Color(0xFF303030),
          primaryVariant: Color(0xFF606060),
          secondary: Colors.white,
          secondaryVariant: Colors.black
        ),
      );
}
