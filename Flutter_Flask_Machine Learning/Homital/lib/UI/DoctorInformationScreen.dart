import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'ChatScreen.dart';
class DoctorInformationScreen extends StatefulWidget {
  @override
  _DoctorInformationScreenState createState() => _DoctorInformationScreenState();
}

class _DoctorInformationScreenState extends State<DoctorInformationScreen> {
  bool shotTextDetail = false;
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
                            "Doctor information",
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
                //
                Expanded(
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      children: [
                        //Space
                        SizedBox(height: 12,),
                        //Dr.
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 8),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     //
                                     Container(
                                       child: Text("Dr. Dimitri Petrenko",
                                       style: TextStyle(
                                         fontSize: 19,
                                         fontWeight: FontWeight.w700,
                                         fontFamily: "medium",
                                         color: Theme.of(context).accentTextTheme.headline2.color
                                       ),),
                                     ),
                                     Container(
                                       padding: EdgeInsets.only(top: 12,bottom: 12),
                                       child: Text("Lorem ipsum dolor sit amet, consec adipiscing elit. Sed sagittis.",
                                         style: TextStyle(
                                             fontSize: 12.5,
                                             fontFamily: "medium",
                                             color: Theme.of(context).accentTextTheme.headline3.color
                                         ),),
                                     ),
                                     //
                                     Container(
                                       child: Row(
                                         children: [
                                           Image.asset("assets/icons/ic_active.png",scale: 40,),
                                           Container(
                                             padding: EdgeInsets.only(left: 7),
                                             child: Text("Active now",
                                             style: TextStyle(
                                              fontSize: 11,
                                               fontFamily: "medium",
                                               color: Theme.of(context).accentTextTheme.headline6.color
                                             )
                                             ),
                                           )
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                                ),
                              ),
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/imgs/checkup.jpg")
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 12,),
                        //Divider
                        Divider(
                          height: 1,
                          color: Theme.of(context).primaryTextTheme.headline3.color,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        //Advice time and Appreciated
                        Container(
                          padding: EdgeInsets.only(left: 16,right: 10,top: 15,bottom: 15),
                          child: Row(
                            children: [
                              //Advice time
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text("2423",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline2.color
                                        ),),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text("Advice time",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "medium",
                                              color: Theme.of(context).accentTextTheme.headline3.color
                                          ),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Appreciated
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text("4322",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "medium",
                                              color: Theme.of(context).accentTextTheme.headline2.color
                                          ),),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text("Appreciated",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "medium",
                                              color: Theme.of(context).accentTextTheme.headline3.color
                                          ),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, SlidePageRoute(page: ChatScreen()));
                                    },
                                      child: Image.asset("assets/icons/ic_chat_2.png",scale: 9,))
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Divider
                        Divider(
                          height: 1,
                          color: Theme.of(context).primaryTextTheme.headline3.color,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        //Profile
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                          child: Text("Profile",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                        ),
                        //
                        Container(
                          padding: EdgeInsets.only(left: 12,right: 16),
                          child: Column(
                            children: [
                              //
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/icons/ic_doctor_1.png",scale: 8,),
                                    ),
                                    Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              //Work Position
                                              Container(
                                                child: Text("Work Position",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context).accentTextTheme.headline3.color
                                                ),),
                                              ),
                                              //Work as Dean
                                              Container(
                                                padding: EdgeInsets.only(top: 3),
                                                child: Text("Work as Dean at Jolow Quacky\nHospital since 1992.",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "medium",
                                                      color: Theme.of(context).accentTextTheme.headline3.color
                                                  ),),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              //
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset("assets/icons/ic_hospital_1.png",scale: 8,),
                                    ),
                                    Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              //Work Position
                                              Container(
                                                child: Text("Work Experience",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: "medium",
                                                      color: Theme.of(context).accentTextTheme.headline3.color
                                                  ),),
                                              ),
                                              //Work as Dean
                                              Container(
                                                padding: EdgeInsets.only(top: 3),
                                                child: Text("47 years of experience.",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "medium",
                                                      color: Theme.of(context).accentTextTheme.headline3.color
                                                  ),),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Specialist
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                          child: Text("Specialist",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                        ),
                        //wrap
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.start,
                            runSpacing: 15.0,
                            spacing: 15.0,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,),
                                width: 140,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/ic_endocrine.png",scale: 25,),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Orthopodist",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context).accentTextTheme.headline5.color
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,),
                                width: 110,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/ic_heart.png",scale: 25,),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Surgeon",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline5.color
                                        ),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,),
                                width: 110,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/ic_dentist.png",scale: 25,),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Dentist",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline5.color
                                        ),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,),
                                width: 110,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/ic_nutrition.png",scale: 25,),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Nutrition",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline5.color
                                        ),),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,),
                                width: 140,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/ic_dermatology.png",scale: 25,),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Dermatology",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline5.color
                                        ),),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Most recent
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                          child: Text("Most recent",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                        ),
                        //Dear doctor..
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 16,),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryTextTheme.headline3.color
                            ),
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Text("Dear doctor, me is Dimitri, when i want to"
                                    "rush B, i just say one, two, three. Don't take the awp but just a p90?,",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline2.color
                                ),),
                              ),
                              //Space
                              SizedBox(height: 20,),
                              //
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text("Male, 29 Years old",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline3.color
                                      ),),
                                    ),
                                    Container(
                                      child: Text("3 days ago",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline3.color
                                        ),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 18,),
                        //Dr. Dimitri
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/imgs/checkup.jpg")
                                  )
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 45,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Dr. Dimitri Petrenko",
                                        style: TextStyle(
                                          fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline3.color
                                        ),),
                                      ),
                                      //star
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 15,),
                        //Dear patient...
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Wrap(
                            children: [
                              Text("Dear patient Dimitri, my name is Petrenko, i play KLow, "
                                  "with same good moloko, i plant the potato, in this yacky lame, every "
                                  "one is my friend, Lorem ipsum dolor sit amet, consectetur adipiscing "
                                  "elit. Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                                  "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. ",
                                maxLines: shotTextDetail ? 10 : 4,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline3.color
                                ),),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    shotTextDetail =! shotTextDetail;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(shotTextDetail ? "Close": "Detail",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline5.color
                                      ),
                                    ),
                                    Image.asset("assets/icons/ic_forward.png",scale: 50,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 20,),
                        //Dear doctor..
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 16,),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).primaryTextTheme.headline3.color
                              ),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Text("Dear doctor, me is Dimitri, when i want to"
                                    "rush B, i just say one, two, three. Don't take the awp but just a p90?,",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline2.color
                                  ),),
                              ),
                              //Space
                              SizedBox(height: 20,),
                              //
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text("Male, 29 Years old",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline3.color
                                        ),),
                                    ),
                                    Container(
                                      child: Text("3 days ago",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "medium",
                                            color: Theme.of(context).accentTextTheme.headline3.color
                                        ),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 18,),
                        //Dr. Dimitri
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/imgs/checkup.jpg")
                                    )
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 45,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Dr. Dimitri Petrenko",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "medium",
                                              color: Theme.of(context).accentTextTheme.headline4.color
                                          ),),
                                      ),
                                      //star
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3),
                                              child: Image.asset("assets/icons/ic_star.png",scale: 32,),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 15,),
                        //Dear patient...
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Wrap(
                            children: [
                              Text("Dear patient Dimitri, my name is Petrenko, i play KLow, "
                                  "with same good moloko, i plant the potato, in this yacky lame, every "
                                  "one is my friend, Lorem ipsum dolor sit amet, consectetur adipiscing "
                                  "elit. Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                                  "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. ",
                                maxLines: shotTextDetail ? 10 : 4,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline3.color
                                ),),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    shotTextDetail =! shotTextDetail;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(shotTextDetail ? "Close": "Detail",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "medium",
                                          color: Theme.of(context).accentTextTheme.headline5.color
                                      ),
                                    ),
                                    Image.asset("assets/icons/ic_forward.png",scale: 50,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Space
                        SizedBox(height: 80,),
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
}
