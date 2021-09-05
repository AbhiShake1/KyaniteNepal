import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:kyanite_nepal/model/home_images_model.dart';
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
              (HomeImagesModel.images?.isNotEmpty ?? false)
                  ? _HomeImageSwiper()
                  : const CircularProgressIndicator().p64(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //final imagesJson = await rootBundle.loadString("assets/files/gems.json");
    final imagesJson = (await get(
      Uri.parse(
          "https://raw.githubusercontent.com/AbhiShake1/KyaniteNepal/main/assets/files/gems.json"),
    ))
        .body;
    final decodedJson = jsonDecode(imagesJson);

    final images = decodedJson["gems"];

    setState(() {
      //print("______________");
      HomeImagesModel.images =
          List.from(images).map((e) => HomeImages.fromMap(e)).toList();
    });
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
