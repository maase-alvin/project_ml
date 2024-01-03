import 'package:flutter/material.dart';
class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       child: Column(
         children: [
           SizedBox(height: 15,),
           //Schedule
           Container(
             padding: EdgeInsets.symmetric(horizontal: 16),
             alignment: Alignment.centerLeft,
             child: Text("Schedule",
               style: TextStyle(
                   fontSize: 27,
                   fontWeight: FontWeight.w700,
                   fontFamily: "medium",
                   color: Theme.of(context).accentTextTheme.headline2.color
               ),),
           ),
           Expanded(
               child: ListView(
                 physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                 children: [
                   //Wait for pay - 1
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                     alignment: Alignment.centerLeft,
                     child: Text("Wait for pay - 1",
                       style: TextStyle(
                           fontSize: 19,
                           fontFamily: "medium",
                           color: Theme.of(context).accentTextTheme.headline2.color
                       ),),
                   ),
                   //Space
                   SizedBox(height: 4,),
                   //card
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 16),
                     child: Card(
                       elevation: 4,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       margin: EdgeInsets.zero,
                       child: Container(
                         height: 125,
                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                         child: Row(
                           children: [
                             //
                             Container(
                               width: 90,
                               height: double.infinity,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7),
                                   image: DecorationImage(
                                       fit: BoxFit.cover,
                                       image: AssetImage("assets/imgs/checkup.jpg")
                                   )
                               ),
                             ) ,
                             Expanded(
                               child: Container(
                                 padding: EdgeInsets.symmetric(horizontal: 12),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     //
                                     Container(
                                       child: Text("Standard health check-up Package",
                                         style: TextStyle(
                                             fontSize: 15,
                                             fontFamily: "medium",
                                             color: Theme.of(context).accentTextTheme.headline2.color
                                         ),),
                                     ),
                                     //
                                     Container(
                                       child: Text("Dimitri Petrenko",
                                         style: TextStyle(
                                             fontSize: 15,
                                             fontFamily: "medium",
                                             color: Theme.of(context).accentTextTheme.headline3.color
                                         ),),
                                     ),
                                     //
                                     Container(
                                       margin: EdgeInsets.only(bottom: 3),
                                       width: MediaQuery.of(context).size.width*0.3,
                                       height: 17,
                                       decoration: BoxDecoration(
                                           color: Theme.of(context).accentTextTheme.headline1.color
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
                   //Ongoing
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                     alignment: Alignment.centerLeft,
                     child: Text("Ongoing",
                       style: TextStyle(
                           fontSize: 18,
                           fontFamily: "medium",
                           color: Theme.of(context).accentTextTheme.headline2.color
                       ),),
                   ),
                   //card
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 16),
                     child: Card(
                       elevation: 4,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       margin: EdgeInsets.zero,
                       child: Container(
                         height: 125,
                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                         child: Row(
                           children: [
                             //
                             Container(
                               width: 90,
                               height: double.infinity,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7),
                                   image: DecorationImage(
                                       fit: BoxFit.cover,
                                       image: AssetImage("assets/imgs/checkup.jpg")
                                   )
                               ),
                             ) ,
                             Expanded(
                               child: Container(
                                 padding: EdgeInsets.symmetric(horizontal: 12),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     //
                                     Container(
                                       child: Text("Standard health check-up Package",
                                         style: TextStyle(
                                             fontSize: 15,
                                             fontFamily: "medium",
                                             color: Theme.of(context).accentTextTheme.headline2.color
                                         ),),
                                     ),
                                     //
                                     Container(
                                       child: Text("Dimitri Petrenko",
                                         style: TextStyle(
                                             fontSize: 15,
                                             fontFamily: "medium",
                                             color: Theme.of(context).accentTextTheme.headline3.color
                                         ),),
                                     ),
                                     //
                                     Container(
                                       margin: EdgeInsets.only(bottom: 3),
                                       width: MediaQuery.of(context).size.width*0.2,
                                       height: 17,
                                       decoration: BoxDecoration(
                                           color: Theme.of(context).accentTextTheme.headline5.color
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
                   //History
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                     alignment: Alignment.centerLeft,
                     child: Text("History",
                       style: TextStyle(
                           fontSize: 18,
                           fontFamily: "medium",
                           color: Theme.of(context).accentTextTheme.headline2.color
                       ),),
                   ),
                   //card
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 16),
                     child: Card(
                       elevation: 4,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       margin: EdgeInsets.zero,
                       child: Container(
                         height: 125,
                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                         child: Row(
                           children: [
                             //
                             Container(
                               width: 90,
                               height: double.infinity,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7),
                                   image: DecorationImage(
                                       fit: BoxFit.cover,
                                       image: AssetImage("assets/imgs/checkup.jpg")
                                   )
                               ),
                             ) ,
                             Expanded(
                               child: Container(
                                 padding: EdgeInsets.symmetric(horizontal: 12),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     //
                                     Container(
                                       child: Text("Standard health check-up Package",
                                         style: TextStyle(
                                             fontSize: 15,
                                             fontFamily: "medium",
                                             color: Theme.of(context).accentTextTheme.headline2.color
                                         ),),
                                     ),
                                     //
                                     Container(
                                       child: Text("Dimitri Petrenko",
                                         style: TextStyle(
                                             fontSize: 15,
                                             fontFamily: "medium",
                                             color: Theme.of(context).accentTextTheme.headline3.color
                                         ),),
                                     ),
                                     //
                                     Container(
                                       margin: EdgeInsets.only(bottom: 3),
                                       width: MediaQuery.of(context).size.width*0.1,
                                       height: 17,
                                       decoration: BoxDecoration(
                                           color: Theme.of(context).accentTextTheme.headline3.color
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
                 ],
               )),
         ],
       ),
     ),
    );
  }
}
