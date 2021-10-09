import 'package:flutter/material.dart';
import 'package:kyanite_nepal/view/component/app_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app_page.dart';

class CartPage extends StatelessPage {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: "cart".text.xl6.makeCentered(),
    );
  }
}
