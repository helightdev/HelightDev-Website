import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:octo_image/octo_image.dart';

class HoverTextStateful extends StatefulWidget {

  final String text;

  const HoverTextStateful({Key key, this.text}) : super(key: key);

  @override
  _HoverTextStatefulState createState() => _HoverTextStatefulState();
}

class _HoverTextStatefulState extends State<HoverTextStateful> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(onEnter: (_) => _hover(true), onExit: (_) => _hover(false),
      cursor: SystemMouseCursors.click,
      child: Text(widget.text,
          style: GoogleFonts.roboto(
              fontSize: 36,
              color: isHover ? Color(0xffE9626C): Colors.white,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                    offset: Offset(1.5, 1.5),
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 1.5)
              ])
      ),
    );
  }

  void _hover(bool state) {
   setState(() {
     isHover = state;
   });
  }
}


class HoverImage extends StatelessWidget {

  final String asset;
  final double size;

  const HoverImage({Key key, this.asset, this.size = 56}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("${asset}_hover.png"), context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: HoverWidget(child: OctoImage(
        image: AssetImage("$asset.png"),
        placeholderBuilder: OctoPlaceholder.circularProgressIndicator(),
        fadeInDuration: Duration(seconds: 1),
        fadeOutDuration: Duration(seconds: 1),
        height: size,
        fit: BoxFit.fitWidth,
      ), hoverChild: Image.asset(
        "${asset}_hover.png",
        height: size,
        fit: BoxFit.fitWidth,
      ), onHover: (PointerEnterEvent event) {  },),
    );
  }
}
