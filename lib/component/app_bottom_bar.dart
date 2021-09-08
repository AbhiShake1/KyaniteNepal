import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 36, 0, 0),
      child: Column(
        children: [
          "example1".text.xl6.make().p64(),
          "example2".text.xl6.make(),
        ],
      )
          .box
          .roundedLg
          .color(context.theme.appBarTheme.backgroundColor!)
          .width(context.screenWidth)
          .make(),
    );
  }
}
