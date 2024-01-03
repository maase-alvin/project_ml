import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/UI/DoctorInformationScreen.dart';

class TabScreen1 extends StatefulWidget {
  @override
  _TabScreen1State createState() => _TabScreen1State();
}

class _TabScreen1State extends State<TabScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: StaggeredGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            itemWidget("assets/imgs/female_dr1.png", "Dr. Dimitri\nPetrenko",
                "Dentist"),
            itemWidget("assets/imgs/male_dr1.png", "Dr. Zackary\nHailarious",
                "Orthopodist\nSurgeon\nDentist"),
            itemWidget("assets/imgs/female_dr2.png", "Dr. Dimitri\nPetrenko",
                "Endocrine\nOrthopodist"),
            itemWidget(
                "assets/imgs/male_dr2.png", "Dr. Dimitri\nPetrenko", "Dentist"),
            itemWidget("assets/imgs/female_dr3.png", "Dr. Zackary\nHailarious",
                "Orthopodist\nSurgeon\nnDentist"),
            itemWidget("assets/imgs/male_dr3.png", "Dr. Dimitri\nPetrenko",
                "Endocrine\nOrthopodist"),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 154),
            StaggeredTile.extent(1, 200),
            StaggeredTile.extent(1, 180),
            StaggeredTile.extent(1, 158),
            StaggeredTile.extent(1, 200),
            StaggeredTile.extent(1, 180),
          ],
        ),
      ),
    );
  }

  //
  Container itemWidget(String img, String title, String subTitle) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.push(
            context, SlidePageRoute(page: DoctorInformationScreen()));
      },
      child: new Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //img
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      width: 35,
                      height: 33,
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(img))),
                    ),
                  ),
                  //Dr. Dimitri
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "medium",
                          color: Theme.of(context).textTheme.headline1.color),
                    ),
                  ),
                  //Dentist
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                end: -1,
                top: -21,
                child: Container(
                  width: 65,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/ic_bg.png"))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/ic_star.png",
                        scale: 38,
                        color: Theme.of(context).textTheme.subtitle2.color,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 7),
                        child: Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "medium",
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
