import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'hover_text.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints.expand(width: 200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse("https://www.linkedin.com/in/christoph-feuerer-b2965b16a/"),
                  builder: (BuildContext context, Future<void> Function() followLink) {
                    return GestureDetector(
                      child: HoverImage(asset: "assets/images/linkedin"),
                      onTap: followLink,
                    );
                  },
                ),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse("https://github.com/helightdev"),
                  builder: (BuildContext context, Future<void> Function() followLink) {
                    return GestureDetector(
                      child: HoverImage(asset: "assets/images/github"),
                      onTap: followLink,
                    );
                  },
                ),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse("https://steamcommunity.com/id/H3light/"),
                  builder: (BuildContext context, Future<void> Function() followLink) {
                    return GestureDetector(
                      child: HoverImage(asset: "assets/images/steam"),
                      onTap: followLink,
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(width: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse("https://skylines.one/"),
                  builder: (BuildContext context, Future<void> Function() followLink) {
                    return GestureDetector(
                      child: HoverTextStateful(text: "Work!"),
                      onTap: followLink,
                    );
                  },
                ),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse("https://medium.com/@helightdev"),
                  builder: (BuildContext context, Future<void> Function() followLink) {
                    return GestureDetector(
                      child: HoverTextStateful(text: "Blog"),
                      onTap: followLink,
                    );
                  },
                ),
                Link(
                  target: LinkTarget.self,
                  uri: Uri.parse("/#about"),
                  builder: (BuildContext context, Future<void> Function() followLink) {
                    return GestureDetector(
                      child: HoverTextStateful(text: "About me"),
                      onTap: () => Navigator.pushNamed(context, "about"),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
