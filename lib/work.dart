
import 'package:flutter/material.dart';
import 'package:helight_website/skill_widget.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:octo_image/octo_image.dart';

class LoadingWork extends StatefulWidget {
  @override
  _LoadingWorkState createState() => _LoadingWorkState();
}

class _LoadingWorkState extends State<LoadingWork> {

  List<AssetImage> assets = ["assets/images/flutter.png", "assets/images/vue.png", "assets/images/jetpack.png",
    "assets/images/docker.png", "assets/images/git.png", "assets/images/gradle.png", "assets/images/java.png",
    "assets/images/kotlin.png", "assets/images/csharp.png", "assets/images/mongodb.png", "assets/images/postgresql.png",
    "assets/images/redis.png", "assets/images/background2.jpg"].map((e) => AssetImage(e)).toList();

  bool isCached = false;

  @override
  Widget build(BuildContext context) {
    if (!isCached) preload();
    return isCached ? Work(images: assets,) : LoadingPlaceholder();
  }

  void preload() async {
    for (var asset in assets) {
      await precacheImage(asset, context);
    }
    await Future.delayed(Duration(milliseconds: 250)); //Looks smoother
    setState(() {
      isCached=true;
    });
  }

}

class LoadingPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF266A7A),
          Color(0xFF194064)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.repeated)
    ), child: Center(child: LoadingBouncingGrid.circle(size: 75, backgroundColor: Color(0xFFFFFFFF),)));
  }
}


class Work extends StatelessWidget {

  static const double goldenRatioSmall = 0.382;
  static const double goldenRatioBig = 0.618;

  final List<AssetImage> images;

  const Work({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var goldenBar = size.height * 0.45;
    var theme = Theme.of(context);
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: [
            Container(
                width: size.width,
                height: goldenBar,
                child: Stack(
                  children: [
                    OctoImage(image: images[12], fit: BoxFit.cover, width: size.width, height: goldenBar,
                        placeholderBuilder: OctoPlaceholder.blurHash(
                         "LK9jshog53fl\$wWAD~ay%QoMR#WB"
                        )),
                    Container(width: size.width, height: goldenBar, color: Colors.black54,),
                    Container(
                      width: size.width,
                      height: goldenBar,
                      child: Row(
                        children: [
                          Flexible(child: Container(), flex: 11, fit: FlexFit.tight,),
                          Flexible(child: Column(
                            children: [
                              Image.asset("assets/images/helight.png",width: goldenBar * goldenRatioBig, height: goldenBar * goldenRatioBig)
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ), flex: 23, fit: FlexFit.tight,),
                          Flexible(child: Column(
                            children: [
                              SelectableText("Christoph Feuerer", style: theme.textTheme.headline3.copyWith(fontSize: 42, color: Colors.white),),
                              SelectableText("Fullstack Software Developer", style: theme.textTheme.headline5.copyWith(fontSize: 36,color: Colors.white.withOpacity(0.85)),),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ), flex: 61, fit: FlexFit.tight,)
                        ],
                      ),
                    )
                  ],
                )
            ),
            Container(height: 32,),
            Text("Hello there!", style: theme.textTheme.headline3.copyWith(color: Colors.black.withOpacity(.85)), textAlign: TextAlign.center),
            SelectableText("""
                              
I'm Christoph Feuerer a german 17 year old self-taught Fullstack Developer, Geek and music enthusiast. 

At the young age of 14 I started developing game modification for the popular voxel game Minecraft, 
where I was involved with mayor german community-servers serving over 1000 players simultaneously 
and gathered lots of backend & fronted experience from there.

After that I joined Skylines One LLC. My major tasks here at Skylines are primarily REST, Api/Framework, 
App & Web Development, as well as DevOps. I'm currently also working on the GameModding-Framework Synapse
for the Unity-based game SCP: Secret Laboratory
                              """, style: theme.textTheme.bodyText1.copyWith(fontSize: 21,color: Colors.black.withOpacity(1)), textAlign: TextAlign.center,),
            Stack(
              children: [
                Positioned(
                    top: 32,
                    left: 16,
                    right: 16,
                    child: Text("Technologies", style: theme.textTheme.headline3.copyWith(color: Colors.black.withOpacity(.85)), textAlign: TextAlign.center)
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SkillWidget(
                            headline: "Frontend",
                            description: """
I'm confident using these technologies in production
for any ui realted or generally graphic usecase
                            """,
                            images: [images[0], images[1], images[2]],
                            technologies: "Dart / Flutter / JavaScript / TypeScript / Jetpack Compose / Vue / TailwindCss",
                          ),
                          SkillWidget(
                            headline: "DevOps",
                            description: """
I'm trained in working with these technologies and
am able to integrate them into your devops pipeline 
                            """,
                            images: [images[3], images[4], images[5]],
                            technologies: "Docker / Git / Space / GitHub / GitLab / Gradle / Maven",
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SkillWidget(
                            headline: "Backend",
                            description: """
I'm skilled in building in production-ready applications
for any backend related usecase like REST-APIs, Microservices, etc. 
                            """,
                            images: [images[6], images[7], images[8]],
                            technologies: "Java / Kotlin / Spring / Quarkus / Ktor / C# / ASP .Net / Maven / Gradle",
                          ),
                          SkillWidget(
                            headline: "Databases",
                            description: """
I have experience with these databases and cloud based
variants of them and can build my applications to work with them
                            """,
                            images: [images[9], images[10], images[11]],
                            technologies: "MongoDB / RavenDB / MySQL / Postgres / SQLite / Redis",
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}