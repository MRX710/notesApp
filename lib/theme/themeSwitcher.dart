import 'package:flutter/material.dart';

var darkTheme = ThemeData.dark();
var lightTheme = ThemeData(
  fontFamily: 'Raleway',
  primaryColor: Colors.blue, // Colors.purple
  brightness: Brightness.light,
  backgroundColor: Colors.blue,

  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
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
