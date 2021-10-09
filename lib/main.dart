import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyanite_nepal/util/app_themes.dart';
import 'package:kyanite_nepal/util/preferences.dart';
import 'package:kyanite_nepal/view/page/app_page.dart';

void main() async {
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
      home: AppPages.pages[Preferences.getInt(Preferences.bottombarIndexKey)],
    );
  }
}
