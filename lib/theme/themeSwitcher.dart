import 'package:flutter/material.dart';

var darkTheme = ThemeData.dark();
var lightTheme = ThemeData(
  fontFamily: 'Raleway',
  primaryColor: Colors.blue, // Colors.purple
  brightness: Brightness.light,

  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
  // colorScheme: const ColorScheme(
  //     background: Colors.blue,
  // ),
);

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  get getTheme => _themeData;
  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
