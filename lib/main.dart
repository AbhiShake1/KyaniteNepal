import 'package:flutter/material.dart';
import 'package:kyanite_nepal/page/home_page.dart';
import 'package:kyanite_nepal/util/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppThemes.light(context),
      darkTheme: AppThemes.dark(context),
      home: const HomePage(),
    );
  }
}
