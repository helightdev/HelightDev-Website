
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helight_website/work.dart';
import 'package:octo_image/octo_image.dart';

import 'color_gradient_text.dart';
import 'nav_bar.dart';

class LoadingHome extends StatefulWidget {
  @override
  _LoadingHomeState createState() => _LoadingHomeState();
}

class _LoadingHomeState extends State<LoadingHome> {

  List<AssetImage> assets = ["assets/images/linkedin.png", "assets/images/steam.png",
    "assets/images/github.png", "assets/images/background1.jpg"].map((e) => AssetImage(e)).toList();

  bool isCached = false;

  @override
  Widget build(BuildContext context) {
    if (!isCached) preload();
    return isCached ? Home() : LoadingPlaceholder();
  }

  void preload() async {
    for (var asset in assets) {
      await precacheImage(asset, context);
    }await Future.delayed(Duration(milliseconds: 250)); //Looks smoother
    setState(() {
      isCached=true;
    });
  }

}

class Home extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: _buildHome(size),
    );
  }

  Container _buildHome(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          OctoImage(
              image: AssetImage("assets/images/background1.jpg"),
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
              placeholderBuilder: OctoPlaceholder.blurHash("L66[]*4TOsxC_NH?XSn#00.7s;NG")),
          Positioned(top: 16, left: 16, right: 16, child: NavigationBar()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*
                  Text("stand out.",
                      style: GoogleFonts.ubuntu(
                          fontSize: 255 * 0.85,
                          color: Colors.white,
                          height: 0.95,
                          shadows: [
                            Shadow(
                                offset: Offset(3, 3),
                                color: Colors.black.withOpacity(0.33),
                                blurRadius: 3)
                          ],
                      )
                  ),
                   */
                ColorGradientText(),
                Text(
                  "- Christoph Feuerer -",
                  style: GoogleFonts.ubuntu(
                      fontSize: 60 * 0.85,
                      color: Colors.white,
                      letterSpacing: 25,
                      height: 0.9,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}