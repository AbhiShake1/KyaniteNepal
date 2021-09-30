import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyanite_nepal/component/app_app_bar.dart';
import 'package:kyanite_nepal/component/app_bottom_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  const AppScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: AppAppBar().make(context),
      //endDrawer: const AppEndDrawer(),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
