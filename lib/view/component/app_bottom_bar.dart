import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kyanite_nepal/util/preferences.dart';
import 'package:kyanite_nepal/view/page/app_page.dart';
import 'package:velocity_x/velocity_x.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    navigateTo(AppPage instance) => context.navigator?.pushReplacement(
          MaterialPageRoute(
            builder: (context) => instance,
            maintainState: true,
          ),
        );

    return BottomNavyBar(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      containerHeight: context.screenHeight / 15,
      selectedIndex: Preferences.getInt(Preferences.bottombarIndexKey),
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      onItemSelected: (index) {
        setState(//here setState needs to be invoked for animation of bottom bar
            () => Preferences.setInt(Preferences.bottombarIndexKey, index));
        navigateTo(AppPages.pages[index]);
      },
      items: [
        BottomNavyBarItem(
          title: "Home".text.make(),
          textAlign: TextAlign.center,
          inactiveColor: Colors.blueGrey,
          icon: const FaIcon(
            CupertinoIcons.home,
          ),
        ),
        BottomNavyBarItem(
          title: "Search".text.make(),
          textAlign: TextAlign.center,
          inactiveColor: Colors.blueGrey,
          icon: const FaIcon(
            CupertinoIcons.search,
          ),
        ),
        BottomNavyBarItem(
          title: "Cart".text.make(),
          textAlign: TextAlign.center,
          inactiveColor: Colors.blueGrey,
          icon: const FaIcon(
            Icons.shopping_bag_outlined,
          ),
        ),
        BottomNavyBarItem(
          title: "Favourites".text.make(),
          textAlign: TextAlign.center,
          activeColor: Colors.red,
          inactiveColor: Colors.blueGrey,
          icon: const FaIcon(
            CupertinoIcons.heart_fill,
          ),
        ),
      ],
    );
  }
}
