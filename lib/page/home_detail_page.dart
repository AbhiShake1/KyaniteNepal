import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyanite_nepal/component/app_list_view.dart';
import 'package:kyanite_nepal/component/app_scaffold.dart';
import 'package:kyanite_nepal/model/home_items_model.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final HomeItems shape;

  const HomeDetailPage(this.shape, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppListView(
        children: [
          Hero(
            tag: Key(shape.id),
            child: VxArc(
              height: 45,
              child: Image.network(
                shape.imageUrl,
                height: context.screenHeight / 2.5,
                width: context.screenWidth,
                fit: BoxFit.fill,
              )
                  .card
                  .color(context.theme.appBarTheme.backgroundColor!)
                  .make()
                  .backgroundColor(context.theme.appBarTheme.backgroundColor!),
            ),
          ),
          (context.screenHeight * 0.3).heightBox,
        ],
      ),
    );
  }
}
