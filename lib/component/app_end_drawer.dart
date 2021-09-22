import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppEndDrawer extends StatelessWidget {
  const AppEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          "dummyText".text.xl5.bold.make().py24(),
          40.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              "dummyText1".text.make(),
              "dummyText2".text.make(),
            ],
          ),
        ],
      )
          .backgroundColor(Colors.transparent)
          .card
          .roundedLg
          .make()
          .h32(context),
    ).px32().py64();
  }
}
