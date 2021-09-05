import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppThemes {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      //primarySwatch: Colors.primaries.first,
      accentColor: Vx.blue900,
      //cardColor: Vx.gray300,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      //primarySwatch: Colors.primaries.last,
      accentColor: Vx.blue700,
      //cardColor: Vx.gray700,
      appBarTheme: const AppBarTheme(
        backgroundColor: Vx.gray700,
      ),
    );
  }
}