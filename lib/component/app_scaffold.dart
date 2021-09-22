import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyanite_nepal/component/app_bottom_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app_end_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  const AppScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Builder(
            builder: (context) =>
                IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(
                    CupertinoIcons.person,
                    color: context.theme.textSelectionColor,
                  ),
                ),
          ).px16(),
        ],
        title: "KYANITE NEPAL"
            .text
            .maxLines(1)
            .bold
            .xl4
            .color(context.accentColor)
            .textStyle(
          GoogleFonts.abhayaLibre(),
        )
            .make(),
      ),
      endDrawer: const AppEndDrawer(),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
