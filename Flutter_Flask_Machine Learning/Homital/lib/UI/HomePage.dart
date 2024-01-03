import 'package:flutter/material.dart';
import 'package:homital/HomePageTabs/HomeScreen.dart';
import 'package:homital/HomePageTabs/NotificationScreen.dart';
import 'package:homital/HomePageTabs/CommunityScreen.dart';
import 'package:homital/HomePageTabs/ProfileScreen.dart';
import 'package:homital/HomePageTabs/ScheduleScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tb;
  @override
  void initState() {
    super.initState();
    tb = TabController(length: 5, vsync: this);
    tb.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  final theImage = Image.asset(
    "assets/icons/ic_schedule1.png",
  );

  /// Did Change Dependencies
  @override
  void didChangeDependencies() {
    precacheImage(theImage.image, context);
    super.didChangeDependencies();
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
                //
                Expanded(
                  child: TabBarView(
                      controller: tb,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        HomeScreen(),
                        ScheduleScreen(),
                        CommunityScreen(),
                        NotificationScreen(),
                        ProfileScreen(),
                      ]),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 4),
              child: TabBar(
                  controller: tb,
                  labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  tabs: [
                    Tab(
                      child: tb.index == 0
                          ? tabItem1(context, 0, "assets/icons/ic_home1.png",
                              10, "Home")
                          : tabItem(0, "assets/icons/ic_home2.png", 20),
                    ),
                    Tab(
                      child: tb.index == 1
                          ? tabItem1(context, 0,
                              "assets/icons/ic_schedule1.png", 10, "Schedule")
                          : tabItem(1, "assets/icons/ic_schedule2.png", 20),
                    ),
                    Tab(
                      child: tb.index == 2
                          ? tabItem1(context, 0,
                              "assets/icons/ic_communityTab1.png", 10, "Q & A")
                          : tabItem(2, "assets/icons/ic_communityTab2.png", 20),
                    ),
                    Tab(
                      child: tb.index == 3
                          ? tabItem1(
                              context,
                              0,
                              "assets/icons/ic_notification1.png",
                              10,
                              "Notification")
                          : tabItem(3, "assets/icons/ic_notification2.png", 20),
                    ),
                    Tab(
                      child: tb.index == 4
                          ? tabItem1(context, 0, "assets/icons/ic_profile1.png",
                              10, "Profile")
                          : tabItem(4, "assets/icons/ic_profile2.png", 18.0),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

Container tabItem1(context, int index, String img, double sc, String title) {
  return Container(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.directional(
          top: -22,
          start: 0,
          end: 0,
          textDirection: Directionality.of(context),
          child: Container(
            child: Column(
              children: [
                Image.asset(
                  img,
                  scale: sc,
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "medium",
                        color:
                            Theme.of(context).accentTextTheme.headline1.color),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//1
Container tabItem(int index, String img, double sc) {
  return Container(
    child: Image.asset(
      img,
      scale: sc,
    ),
  );
}
