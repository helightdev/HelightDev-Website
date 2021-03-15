import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorGradientText extends StatefulWidget {
  @override
  _ColorGradientTextState createState() => _ColorGradientTextState();
}

class _ColorGradientTextState extends State<ColorGradientText> {

  Color curColor = Colors.white;
  Color targetColor = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Text("stand out.", style: GoogleFonts.ubuntu(fontSize: 255 * 0.85, shadows: [
      Shadow(
          offset: Offset(6, 9),
          color: Colors.black.withOpacity(0.33),
          blurRadius: 6)
    ], foreground: Paint()..shader=LinearGradient(colors: [
      Color(0xFFEA796D),
      Color(0xFFE9626C)
    ]).createShader(Rect.fromLTWH(0,0, size.width/2, 255))));
  }
}
