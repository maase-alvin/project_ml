import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class AllTab extends StatefulWidget {
  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  bool shotTextDetail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            //Space
            SizedBox(height: 7,),
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
                          fontSize: 15,
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
                                fontSize: 11,
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
                      padding: EdgeInsets.only(left: 15,top: 0,bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Dr. Dimitri Petrenko",
                              style: TextStyle(
                                  fontSize: 14,
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
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
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
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
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
                        Text(shotTextDetail ?"Close": "Detail",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline5.color
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //share and Thanks
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Share",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "medium",
                            color: Theme.of(context).textTheme.headline2.color
                          ),),
                        ),
                        Image.asset("assets/icons/ic_share_2.png",scale: 28,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Thanks",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context).textTheme.headline2.color
                            ),),
                        ),
                        Image.asset("assets/icons/ic_like.png",scale: 28,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
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
                          fontSize: 15,
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
                                fontSize: 11,
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
                      padding: EdgeInsets.only(left: 15,top: 0,bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Dr. Dimitri Petrenko",
                              style: TextStyle(
                                  fontSize: 14,
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
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
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
                    maxLines: shotTextDetail ? 4 : 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
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
                        Text(shotTextDetail ? "Detail":"Close",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline5.color
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //share and Thanks
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Share",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context).textTheme.headline2.color
                            ),),
                        ),
                        Image.asset("assets/icons/ic_share_2.png",scale: 28,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Thanks",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context).textTheme.headline2.color
                            ),),
                        ),
                        Image.asset("assets/icons/ic_like.png",scale: 28,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
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
                          fontSize: 15,
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
                                fontSize: 11,
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
                      padding: EdgeInsets.only(left: 15,top: 0,bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Dr. Dimitri Petrenko",
                              style: TextStyle(
                                  fontSize: 14,
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
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
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
                    maxLines: shotTextDetail ? 4 : 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
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
                        Text(shotTextDetail ? "Detail":"Close",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline5.color
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //share and Thanks
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Share",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context).textTheme.headline2.color
                            ),),
                        ),
                        Image.asset("assets/icons/ic_share_2.png",scale: 28,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Thanks",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context).textTheme.headline2.color
                            ),),
                        ),
                        Image.asset("assets/icons/ic_like.png",scale: 28,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
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
                          fontSize: 15,
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
                                fontSize: 11,
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
                      padding: EdgeInsets.only(left: 15,top: 0,bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Dr. Dimitri Petrenko",
                              style: TextStyle(
                                  fontSize: 14,
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
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset("assets/icons/ic_star.png",scale: 30,),
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
                    maxLines: shotTextDetail ? 4 : 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
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
                        Text(shotTextDetail ? "Detail":"Close",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context).accentTextTheme.headline5.color
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //share and Thanks
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Share",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context).textTheme.headline2.color
                            ),),
                        ),
                        Image.asset("assets/icons/ic_share_2.png",scale: 28,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text("Thanks",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context).textTheme.headline2.color
                            ),),
                        ),
                        Image.asset("assets/icons/ic_like.png",scale: 28,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 20,),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
            ),
            //Space
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
