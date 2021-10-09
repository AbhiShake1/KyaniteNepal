import 'package:flutter/material.dart';
import 'package:kyanite_nepal/view/page/search_page.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'liked_page.dart';

class AppPages{
  static const pages = <AppPage>[
    HomePage(),
    SearchPage(),
    CartPage(),
    LikedPage(),
  ];
}

/*
 *this is the superclass and every page requiring navigation from bottom bar must extend it
 *shouldnt impact performance if we dont change states when not needed
*/
abstract class AppPage extends Widget {
  const AppPage({Key? key}) : super(key: key);
}

abstract class StatefulPage extends StatefulWidget implements AppPage {
  const StatefulPage({Key? key}) : super(key: key);
}

abstract class StatelessPage extends StatelessWidget implements AppPage {
  const StatelessPage({Key? key}) : super(key: key);
}
