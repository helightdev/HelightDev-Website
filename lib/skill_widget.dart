import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {

  final String headline;
  final String description;
  final List<ImageProvider> images;
  final String technologies;

  const SkillWidget({Key key, this.headline, this.description, this.images, this.technologies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          SelectableText(headline, style: theme.textTheme.headline4.copyWith(fontSize: 36,foreground: Paint()..shader=LinearGradient(colors: [
            Color(0xFF266A7A),
            Color(0xFF194064)
          ]).createShader(Rect.fromLTWH(0,0, 200, 40)))),
          SelectableText(description, style: theme.textTheme.subtitle1.copyWith(fontSize: 21), textAlign: TextAlign.center,),
          Row(children: images.map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Image(image: e),
          )).toList(), mainAxisAlignment: MainAxisAlignment.center),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: SelectableText(technologies, style: theme.textTheme.bodyText2.copyWith(fontSize: 21), textAlign: TextAlign.center,),
            ),
            decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFFE1E1E1))
            ),
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
          )
        ],
      ),
    );
  }
}