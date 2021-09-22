import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        Builder(
          builder: (context) => IconButton(
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
    );
  }
}
