import 'package:flutter/material.dart';

//this is the superclass and every page requiring navigation from bottom bar must extend it
//shouldnt impact performance if we dont change states when not needed
class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
