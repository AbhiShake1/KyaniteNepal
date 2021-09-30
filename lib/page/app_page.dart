import 'package:flutter/material.dart';

//this is the superclass and every page requiring navigation from bottom bar must extend it
//shouldnt impact performance if we dont change states when not needed
abstract class AppPage extends Widget {}

abstract class AppPageStateful extends StatefulWidget implements AppPage {
  const AppPageStateful({Key? key}) : super(key: key);
}

abstract class AppPageStateless extends StatelessWidget implements AppPage {
  const AppPageStateless({Key? key}) : super(key: key);
}
