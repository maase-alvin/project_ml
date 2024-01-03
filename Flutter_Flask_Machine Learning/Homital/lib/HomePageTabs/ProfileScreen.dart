import 'package:flutter/material.dart';
import 'package:homital/Account/SignIn.dart';
import 'package:homital/UI/AboutUs.dart';
import 'package:homital/UI/PaymentMethodScreen.dart';
import 'package:homital/UI/SelectAddressScreen.dart';
import 'package:homital/UI/SelectProfieScreen.dart';
import 'package:homital/animation/SlideRightRoute.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 15,),
          //Profile
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text("Profile",
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color
              ),),
          ),
          //Space
          SizedBox(height: 15,),
          //Profiel img
          InkWell(
            onTap: (){
              Navigator.push(context, SlidePageRoute(page: SignIn()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/imgs/nana_kor.png")
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Name
                          Container(
                            child: Text("Dimitri Petrenko",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                          ),
                          //
                          Container(
                            width: 80,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentTextTheme.headline4.color
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Image.asset("assets/icons/ic_forward.png",scale: 30,),
                  )
                ],
              ),
            ),
          ),
          //Space
          SizedBox(height: 30,),
          //card
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
              ),
              margin: EdgeInsets.zero,
              child: Container(
                height: 50,
                padding: EdgeInsets.only(left: 13,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Expanded(
                     child: Container(
                       child: RichText(
                         text: TextSpan(
                           text: "2  ",
                           style: TextStyle(
                             fontSize: 13,
                             fontFamily: "medium",
                             color: Theme.of(context).accentTextTheme.headline5.color
                           ),
                           children: [
                             TextSpan(
                               text: "advice ticket remaining",
                               style: TextStyle(
                                 fontSize: 13,
                                 fontFamily: "medium",
                                 color: Theme.of(context).accentTextTheme.headline4.color
                               )
                             )
                           ]
                         ),
                       ),
                     ),
                   ),
                    Image.asset("assets/icons/ic_forward.png",scale: 30,)
                  ],
                ),
              ),
            ),
          ),
          //Space
          SizedBox(height: 27,),
          //Profile Settings
          InkWell(
            onTap: (){
              Navigator.push(context, SlidePageRoute(page: SelectProfileScreen()));
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_profile_1.png",scale: 22,),
                  Container(
                    padding: EdgeInsets.only(left: 14),
                    child: Text("Profile Settings",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "medium",
                      color: Theme.of(context).accentTextTheme.headline3.color
                    ),),
                  )
                ],
              ),
            ),
          ),
          //Q & A History
          InkWell(
            onTap: (){

            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_history.png",scale: 22,),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("Q & A History",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  )
                ],
              ),
            ),
          ),
          //Space
          SizedBox(height: 13,),
          //Address
          InkWell(
            onTap: (){
              Navigator.push(context, SlidePageRoute(page: SelectAddressScreen()));
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_loc4.png",scale: 22,),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Address",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  )
                ],
              ),
            ),
          ),
          //Payment Method
          InkWell(
            onTap: (){
              Navigator.push(context, SlidePageRoute(page: PaymentMethodScreen()));
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_payment.png",scale: 22,),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("Payment Method",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  )
                ],
              ),
            ),
          ),
          //Space
          SizedBox(height: 13,),
          //Help Center
          InkWell(
            onTap: (){},
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_help.png",scale: 22,),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("Help Center",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  )
                ],
              ),
            ),
          ),
          //Hotline
          InkWell(
            onTap: (){

            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_hotline.png",scale: 22,),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("Hotline",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  )
                ],
              ),
            ),
          ),
          //About Us
          InkWell(
            onTap: (){
              Navigator.push(context, SlidePageRoute(page: AboutUs()));
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_about.png",scale: 22,),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("About Us",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  )
                ],
              ),
            ),
          ),
          //Space
          SizedBox(height: 13,),
          //Logout
          InkWell(
            onTap: (){
              logoutDialogue();
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/icons/ic_logout.png",scale: 20,
                      color: Theme.of(context).accentTextTheme.headline1.color),
                  Container(
                    padding: EdgeInsets.only(left: 11),
                    child: Text("Logout",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context).accentTextTheme.headline1.color
                      ),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void logoutDialogue() {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
            builder: (context,setState){
              return  Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                insetPadding: EdgeInsets.all(30),
                child: Container(
                  height: 164,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 4,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Logout",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "medium",
                                    color: Theme.of(context).textTheme.headline1.color
                                ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 9),
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: new TextSpan(
                                  text: "Are you sure ?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline2.color
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text("No",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline1.color
                                  ),),
                              ),
                            ),
                            //Space
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text("Logout",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline1.color
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }
}
