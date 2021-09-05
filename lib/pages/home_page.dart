import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:kyanite_nepal/model/home_items_model.dart';
import 'package:kyanite_nepal/util/app_themes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppThemes.light(context),
      darkTheme: AppThemes.dark(context),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: "KYANITE NEPAL"
              .text
              .bold
              .xl4
              .color(context.accentColor)
              .textStyle(
                GoogleFonts.abhayaLibre(),
              )
              .make(),
        ),
        endDrawer: const Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _SocialLinks(),
              SizedBox(
                height: context.screenHeight / 2,
                child: (HomeImagesModel.images?.isNotEmpty ?? false)
                    ? _HomeImageSwiper()
                    : const CircularProgressIndicator()
                        .p64()
                        .shimmer()
                        .centered(),
              ),
              (HomeShapesModel.shapes?.isNotEmpty ?? false)
                  ? _HomeShapesGrid()
                  : const LinearProgressIndicator().p64().shimmer(),
            ],
          ),
        ),
      ),
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

class _HomeShapesGrid extends StatefulWidget {
  @override
  State<_HomeShapesGrid> createState() => _HomeShapesGridState();
}

class _HomeShapesGridState extends State<_HomeShapesGrid> {
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
            .xl3
            .underline
            .make(),
        GridView.builder(
          shrinkWrap: true,
          //disable internal scrolling
          physics: const NeverScrollableScrollPhysics(),
          itemCount: HomeShapesModel.shapes!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 13,
            crossAxisSpacing: 13,
          ),
          itemBuilder: (context, index) {
            final shape = HomeShapesModel.shapes![index];
            return Card(
              color: context.theme.appBarTheme.backgroundColor!,
              child: GridTile(
                child: Image.network(shape.imageUrl),
                header: GridTileBar(
                  subtitle: "dummy text".text.makeCentered(),
                  title: shape.shape.text.bold.xl2.makeCentered(),
                ),
              ),
            ).box.withRounded(value: 40).clip(Clip.antiAlias).make().p16();
          },
        ),
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
        "Follow us".text.make(),
        const Icon(
          FontAwesomeIcons.facebookF,
          size: 15,
        ).px4(),
        const Icon(
          FontAwesomeIcons.instagram,
          size: 15,
        ).px4(),
        const WidthBox(0).expand(),
        OutlinedButton(
          child: "+977-9858050646".text.color(context.accentColor).make(),
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
      itemCount: HomeImagesModel.images!.length,
      enlargeCenterPage: true,
      aspectRatio: 1,
      itemBuilder: (context, index) {
        final image = HomeImagesModel.images![index];
        return VxBox(
                //child: ZStack([]),
                )
            .roundedLg
            .bgImage(
              DecorationImage(
                image: NetworkImage(image.imageUrl),
                fit: BoxFit.cover,
              ),
            )
            .color(context.theme.appBarTheme.backgroundColor!)
            .make()
            .px16()
            .py64();
      },
    );
  }
}
