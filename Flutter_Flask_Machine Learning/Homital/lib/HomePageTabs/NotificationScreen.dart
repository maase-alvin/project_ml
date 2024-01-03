import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              //Space
              SizedBox(height: 15,),
              //Notification
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    Container(
                      child: Text("Notification",
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            fontFamily: "medium",
                            color: Theme.of(context).accentTextTheme.headline2.color
                        ),),
                    ),
                    InkWell(
                        onTap: (){
                          markDialogue();
                        },
                        child: Image.asset("assets/icons/ic_checked.png",scale: 20,))
                  ],
                ),
              ),
              //Space
              SizedBox(height: 25,),
              //Divider
              Divider(
                height: 1,
                color: Theme.of(context).primaryTextTheme.headline4.color,
                thickness: 1,
                indent: 18,
                endIndent: 18,
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    //Space
                    SizedBox(height: 8,),
                    //March 11,2020
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("March 11,2020",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                          ),
                          Container(
                            child: Text("New",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline1.color
                              ),),
                          ),
                        ],
                      ),
                    ),
                    //Space
                    SizedBox(height: 10,),
                    //COVID-19
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("COVID-19 process attacks the human body !!",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "medium",
                            color: Theme.of(context).accentTextTheme.headline2.color
                        ),),
                    ),
                    //Lorem ipsun dolor...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                      child: Text("Lorem ipsum dolor sit amet, consecectetur adipiscing elit."
                          "Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                          "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. In ,"
                          "ultricies, libero nec pellentesque tincidunt, orci mi vehicula ex, "
                          "sed tristique metus diam ullamcorper dui.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "medium",
                            color: Theme.of(context).accentTextTheme.headline2.color
                        ),),
                    ),
                    //Space
                    SizedBox(height: 5,),
                    //Divider
                    Divider(
                      height: 1,
                      color: Theme.of(context).primaryTextTheme.headline3.color,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    //Space
                    SizedBox(height: 10,),
                    //March 11,2020
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("March 11,2020",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Space
                    SizedBox(height: 10,),
                    //Human natural ...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Human natural immune system ?",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Lorem ipsun dolor...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                      child: Text("Lorem ipsum dolor sit amet, consecectetur adipiscing elit."
                          "Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                          "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. In ,"
                          "ultricies, libero nec pellentesque tincidunt, orci mi vehicula ex, "
                          "sed tristique metus diam ullamcorper dui.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Space
                    SizedBox(height: 5,),
                    //Divider
                    Divider(
                      height: 1,
                      color: Theme.of(context).primaryTextTheme.headline4.color,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    //Space
                    SizedBox(height: 10,),
                    //March 11,2020
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("March 11,2020",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Space
                    SizedBox(height: 10,),
                    //WHO Decleares COVID ...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("WHO Declares COVID-19 Outbreak a Pandemic",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Lorem ipsun dolor...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                      child: Text("Lorem ipsum dolor sit amet, consecectetur adipiscing elit."
                          "Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                          "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. In ,"
                          "ultricies, libero nec pellentesque tincidunt, orci mi vehicula ex, "
                          "sed tristique metus diam ullamcorper dui.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Space
                    SizedBox(height: 5,),
                    //Divider
                    Divider(
                      height: 1,
                      color: Theme.of(context).primaryTextTheme.headline4.color,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    //Space
                    SizedBox(height: 10,),
                    //March 11,2020
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("March 11,2020",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Space
                    SizedBox(height: 10,),
                    //COVID-19 ...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("COVID-19 process attacks the human body !!",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Lorem ipsun dolor...
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                      child: Text("Lorem ipsum dolor sit amet, consecectetur adipiscing elit."
                          "Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                          "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. In ,"
                          "ultricies, libero nec pellentesque tincidunt, orci mi vehicula ex, "
                          "sed tristique metus diam ullamcorper dui.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                        ),),
                    ),
                    //Space
                    SizedBox(height: 5,),
                    //Divider
                    Divider(
                      height: 1,
                      color: Theme.of(context).primaryTextTheme.headline4.color,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    //Space
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void markDialogue() {
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
                  height: 170,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      Container(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Mark as all read?",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline2.color
                                ),),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              alignment: Alignment.centerLeft,
                              child: Text("All the unread notification will be mark as readed.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline3.color
                                ),),
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
                                child: Text("Cancel",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline4.color
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
                                child: Text("Confirm",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "medium",
                                      color: Theme.of(context).accentTextTheme.headline5.color
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
