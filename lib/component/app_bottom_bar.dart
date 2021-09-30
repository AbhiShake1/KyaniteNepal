import 'package:flutter/material.dart';
import 'package:kyanite_nepal/page/app_page.dart';
import 'package:kyanite_nepal/page/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateTo(AppPage instance) =>
        context.navigator?.pushReplacement(MaterialPageRoute(
          builder: (context) => instance,
        ));
    return VxArc(
      height: 20,
      edge: VxEdge.TOP,
      child: VxBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              onPressed: () => navigateTo(const HomePage()),
              label: "ssaod".text.make(),
            ),
            FloatingActionButton.extended(
              onPressed: () => navigateTo(const HomePage()),
              label: "ssaod".text.make(),
            ),
            FloatingActionButton.extended(
              onPressed: () => navigateTo(const HomePage()),
              label: "ssaod".text.make(),
            )
          ],
        ),
      )
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
