import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppAppBar extends AppBar {
  AppAppBar({Key? key}) : super(key: key);

  //this is a custom method and not overridden
  AppBar make(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        Builder(
          builder: (context) => IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const UserDrawer(),
            ),
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

class UserDrawer extends Dialog {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      //this ensures screen doesnt have to be tapped after dismissing
      onDismissed: (direction) => context.navigator?.pop("dialog"),
      //pop immediately for playstore-like effect. default is set to higher value
      resizeDuration: const Duration(
        milliseconds: 1,
      ),
      dismissThresholds: const {
        //default is higher than this
        DismissDirection.down: 0.05,
      },
      direction: DismissDirection.down,
      key: const Key(""),
      //not sure what key is used for here (maybe item value)
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
      ).backgroundColor(Colors.transparent).card.roundedLg.make().h32(context),
    ).px32().py64().objectTopCenter().glassMorphic(
      blur: 1,
    );
  }
}
