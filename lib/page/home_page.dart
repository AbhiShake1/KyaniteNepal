import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:kyanite_nepal/component/app_list_view.dart';
import 'package:kyanite_nepal/model/home_items_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppListView(
      children: [
        const _SocialLinks(),
        SizedBox(
          height: context.screenHeight / 3,
          child: (HomeImagesModel.images?.isNotEmpty ?? false)
              ? _HomeImageSwiper()
              : const CircularProgressIndicator().p64().shimmer().centered(),
        ),
        (HomeShapesModel.shapes?.isNotEmpty ?? false)
            ? _HomeShapesGrid()
            : const LinearProgressIndicator(
                value: 100,
              ).p64().shimmer(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    loadImages();
    loadShapes();
  }

  loadShapes() async {
    final shapesJson = (await get(
      Uri.parse(
          "https://raw.githubusercontent.com/AbhiShake1/KyaniteNepal/main/assets/files/shapes.json"),
    ))
        .body;
    //await rootBundle.loadString("assets/files/shapes.json");

    final decodedJson = jsonDecode(shapesJson);

    final shapes = decodedJson["shapes"];

    setState(() {
      HomeShapesModel.shapes =
          List.from(shapes).map((e) => HomeItems.fromMap(e)).toList();
    });
  }

  loadImages() async {
    //final imagesJson = await rootBundle.loadString("assets/files/gems.json");
    final imagesJson = (await get(
      Uri.parse(
          "https://raw.githubusercontent.com/AbhiShake1/KyaniteNepal/main/assets/files/gems.json"),
    ))
        .body;
    final decodedJson = jsonDecode(imagesJson);

    final images = decodedJson["gems"];

    setState(() {
      HomeImagesModel.images =
          List.from(images).map((e) => HomeItems.fromMap(e)).toList();
    });
  }
}

class _HomeShapesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        "Browse  our  shapeS"
            .text
            .textStyle(
              GoogleFonts.alegreyaSc(),
            )
            .xl5
            .underline
            .bold
            .make(),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: HomeShapesModel.shapes!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 13,
            crossAxisSpacing: 13,
          ),
          itemBuilder: (context, index) {
            final shape = HomeShapesModel.shapes![index];
            return InkWell(
              child: Card(
                color: context.cardColor,
                shadowColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: GridTile(
                  child: Hero(
                    tag: Key(shape.id),
                    child: Image.network(shape.imageUrl),
                  ),
                  footer: GridTileBar(
                    title: shape.shape.text.bold
                        .color(context.theme.textSelectionColor)
                        .xl2
                        .makeCentered(),
                  ),
                ),
              ),
              onTap: () => context.navigator?.push(
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(shape),
                ),
              ),
            ).card.color(context.accentColor).roundedLg.make().p16();
          },
        ).h48(context),
      ],
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "Follow us"
            .text
            .textStyle(GoogleFonts.daysOne())
            .scale(1.3)
            .make()
            .shimmer(
              primaryColor: context.accentColor,
            ),
        const Icon(
          FontAwesomeIcons.facebookF,
          size: 20,
          color: Colors.blueAccent,
        ).px16().shimmer(
              primaryColor: Colors.blueAccent,
              secondaryColor: Colors.lightBlueAccent,
            ),
        const Icon(
          FontAwesomeIcons.instagram,
          size: 20,
          color: Colors.pink,
        ).px8().shimmer(
              primaryColor: Colors.pink,
              secondaryColor: Colors.red,
            ),
        const WidthBox(0).expand(),
        OutlinedButton(
          child: "CALL US".text.bold.color(context.accentColor).make(),
          onPressed: () => launch("tel://+9779858050646"),
          onLongPress: () {
            Clipboard.setData(
              const ClipboardData(
                text: "+9779858050646",
              ),
            );
            VxToast.show(
              context,
              msg: "Number copied to clipboard",
              bgColor: context.accentColor.withOpacity(0.3),
            );
          },
        ).p8(),
      ],
    )
        .p8()
        .box
        .color(context.theme.appBarTheme.backgroundColor!)
        .bottomRounded(value: 30)
        .make();
  }
}

class _HomeImageSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: context.isMobile ? 1 : 2,
      scrollDirection: context.isMobile ? Axis.horizontal : Axis.vertical,
      itemCount: HomeImagesModel.images!.length,
      itemBuilder: (context, index) {
        final image = HomeImagesModel.images![index];
        return VxBox(
                //child: ZStack([]),
                )
            .roundedLg
            .bgImage(
              DecorationImage(
                image: NetworkImage(image.imageUrl),
                fit: BoxFit.fitHeight,
              ),
            )
            .color(context.cardColor)
            .make()
            .px16()
            .py(context.isMobile ? 64 : 10);
      },
    );
  }
}
