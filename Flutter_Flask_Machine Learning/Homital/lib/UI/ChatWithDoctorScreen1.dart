import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class ChatWithDoctorScreen1 extends StatefulWidget {
  @override
  _ChatWithDoctorScreen1State createState() => _ChatWithDoctorScreen1State();
}

class _ChatWithDoctorScreen1State extends State<ChatWithDoctorScreen1> {
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
                            Navigator.pop(context);
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
                            "Chat with doctor",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'medium',
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //List
                Expanded(
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        //Img
                        Container(
                            child: Stack(
                              children: [
                                Center(child: Image.asset("assets/icons/ic_chat3.png",scale: 2,)),
                                Positioned.directional(
                                  textDirection: Directionality.of(context),
                                  bottom: 10,
                                  start: 0,
                                  end: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Get new doctor's advice now",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline3.color
                                      ),),
                                  ),
                                )
                              ],
                            )),
                        //Space
                        SizedBox(height: 30,),
                        //Choose doctor
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20,right: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Choose doctor",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline2.color
                                  ),),
                                ),
                                //
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Text("See all",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline5.color
                                        ),),
                                      ),
                                      Image.asset("assets/icons/ic_forward.png",scale: 44,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //Space
                        SizedBox(height: 20,),
                        Container(
                            padding: EdgeInsets.only(left: 18,right: 18),
                            child: StaggeredGridView.count(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              children: [
                                itemWidget("assets/imgs/female_dr1.png","Dr. Dimitri\nPetrenko","Dentist"),
                                itemWidget("assets/imgs/male_dr1.png","Dr. Zackary\nHailarious","Orthopodist\nSurgeon\nDentist"),
                                itemWidget("assets/imgs/female_dr2.png","Dr. Dimitri\nPetrenko","Endocrine\nOrthopodist"),
                                itemWidget("assets/imgs/male_dr2.png","Dr. Dimitri\nPetrenko","Dentist"),
                                itemWidget("assets/imgs/female_dr3.png","Dr. Zackary\nHailarious","Orthopodist\nSurgeon\nnDentist"),
                                itemWidget("assets/imgs/male_dr3.png","Dr. Dimitri\nPetrenko","Endocrine\nOrthopodist"),                            ],
                              staggeredTiles: [
                                StaggeredTile.extent(1,154),
                                StaggeredTile.extent(1,200),
                                StaggeredTile.extent(1,180),
                                StaggeredTile.extent(1,158),
                                StaggeredTile.extent(1,200),
                                StaggeredTile.extent(1,180),
                              ],
                            ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  //
  Container itemWidget(String img,String title, String subTitle){
    return Container(
        child: InkWell(
          onTap: (){

          },
          child: new Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9)
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //img
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Container(
                          width: 35,
                          height: 33,
                          margin: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(img)
                              )
                          ),
                        ),
                      ),
                      //Dr. Dimitri
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(title,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "medium",
                              color: Theme.of(context).textTheme.headline1.color
                          ),),
                      ),
                      //Dentist
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(subTitle,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline3.color
                          ),),
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
                              image: AssetImage("assets/icons/ic_bg.png")
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/ic_star.png",scale: 38,
                            color: Theme.of(context).textTheme.subtitle2.color,) ,
                          Container(
                            padding: EdgeInsets.only(left: 3,right: 7),
                            child: Text("4.5",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "medium",
                                  color: Theme.of(context).textTheme.subtitle2.color
                              ),),
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ));
  }
}
