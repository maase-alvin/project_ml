import 'package:flutter/material.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'PickTimeScreen1.dart';
class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  List _img =[
    "assets/icons/ic_clinic_1.png",
    "assets/icons/ic_clinic_2.png",
    "assets/icons/ic_clinic_3.png",
  ];
  int tapIndex;
  @override
  void initState() {
    super.initState();
    tapIndex;
  }
  bool isTap=false;
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
                            "Hospital, clinic",
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
                //Space
                SizedBox(height: 10,),
                //
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: _img.length,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        child:  Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              width: 1,
                              color:tapIndex==index? Theme.of(context).accentTextTheme.headline1.color:
                                  Colors.transparent
                            )
                          ),
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                tapIndex=index;
                                isTap=true;
                              });
                            },
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                              child: Row(
                                children: [
                                  //
                                  Container(
                                    width: 90,
                                    height: double.infinity,
                                   child: Image.asset(_img[index],scale: 5,),
                                  ) ,
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //
                                          Container(
                                            child: Text("Jolow quacky hospital",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context).accentTextTheme.headline2.color.withOpacity(0.9)
                                              ),),
                                          ),
                                          //Space
                                          SizedBox(height: 3,),
                                          //
                                          Container(
                                            child: Text("99 Crown street\nLondon city",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "medium",
                                                  color: Theme.of(context).accentTextTheme.headline3.color
                                              ),),
                                          ),
                                          //Space
                                          SizedBox(height: 9,),
                                          //
                                          Container(
                                            child: Row(
                                              children: [
                                                //
                                                Transform.translate(
                                                  offset: Offset(-4.0,0.0),
                                                  child: Image.asset("assets/icons/ic_loc4.png",scale: 25,
                                                      color: Theme.of(context).accentTextTheme.headline1.color),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(left: 2),
                                                  child: Text("2,4 miles",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: "medium",
                                                    color: Theme.of(context).accentTextTheme.headline1.color
                                                  ),),
                                                )
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
                    })
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              child:  Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 44,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if(isTap==true){
                            Navigator.push(context, SlidePageRoute(page: PickTimeScreen1()));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(6)),
                         color: isTap? Theme.of(context).accentTextTheme.headline1.color:
                         Theme.of(context).primaryTextTheme.headline3.color,
                        elevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color:  Theme.of(context).textTheme.subtitle2.color,
                                fontSize: 15,
                                fontFamily: 'medium'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
