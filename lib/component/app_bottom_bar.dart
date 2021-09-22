import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxArc(
      height: 20,
      edge: VxEdge.TOP,
      child: VxBox()
          .width(context.screenWidth)
          .height(context.screenHeight / 15)
          .color(context.theme.appBarTheme.backgroundColor!)
          .topRounded(
            value: 30,
          )
          .make(),
    );
  }
}
