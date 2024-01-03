import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/DoctorListScreenTabs/MalariaDeng.dart';

import 'package:homital/DoctorListScreenTabs/Detection.dart';
import 'package:homital/DoctorListScreenTabs/DiabetesandBP.dart';
import 'package:homital/HomePageTabs/HomeScreen.dart';

import 'CategoriesScreen.dart';

class DoctorListScreen extends StatefulWidget {
  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen>
    with SingleTickerProviderStateMixin {
  TabController tb;
  @override
  void initState() {
    super.initState();
    tb = TabController(length: 3, vsync: this);
    tb.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                //Appbar
                Container(
                  height: 50,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //back btn
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: -4,
                        top: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return HomeScreen();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/icons/ic_back.png",
                              scale: 30,
                            ),
                          ),
                        ),
                      ),
                      //title
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        top: 0,
                        bottom: 0,
                        start: 0,
                        end: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "AI-Driven Engine",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'medium',
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Space
                SizedBox(
                  height: 8,
                ),
                //TabBar
                Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 0),
                    child: TabBar(
                        controller: tb,
                        //    labelPadding: EdgeInsets.symmetric(vertical: 2.0),
                        isScrollable: true,
                        tabs: [
                          Tab(
                              child: tabItem1(
                                  context, 0, "Skin Cancer Diagnosis")),
                          Tab(
                              child:
                                  tabItem1(context, 1, "Diabetes Diagnosis")),
                          Tab(
                              child: tabItem1(context, 2,
                                  "Malaria and Dengue Fever Diagnosis")),
                          // Tab(child: tabItem1(context, 3, "BP Diagnosis")),
                          // Tab(
                          //     child: tabItem1(
                          //         context, 4, "Dengue Fever Diagnosis")),
                        ])),
                //

                //
                Expanded(
                  child: TabBarView(controller: tb, children: [
                    Skin2(),
                    DiabetesBP(),
                    MalariaDengue(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container tabItem1(context, int index, String title) {
    return Container(
        child: Column(
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "medium",
                color: tb.index == index
                    ? Theme.of(context).accentTextTheme.headline5.color
                    : Theme.of(context).accentTextTheme.headline4.color),
          ),
        ),
        //Space
        SizedBox(
          height: 4,
        ),
        //
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              color: tb.index == index
                  ? Theme.of(context).accentTextTheme.headline5.color
                  : Colors.transparent,
              shape: BoxShape.circle),
        )
      ],
    ));
  }
}
