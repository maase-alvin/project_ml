import 'package:flutter/material.dart';
import 'package:homital/animation/SlideRightRoute.dart';

import 'YourBillingScreen.dart';
class BasicHealthScreen extends StatefulWidget {
  @override
  _BasicHealthScreenState createState() => _BasicHealthScreenState();
}

class _BasicHealthScreenState extends State<BasicHealthScreen> {
  List _testList =[
    "Urea",
    "Creatinine",
    "Glucose",
    "LDL cholest",
    "HDL cholest",
    "Trighlycerid",
    "GGT",
    "Cholesterol",
    "SGOT",
    "Urine analyse",
    "CBC",
  ];
  List _checkUpList =[
    "Internal management examinations",
    "X-ray",
    "ECG",
    "Color abdominal ultrasound overview",
  ];
  //Tests Items
  Container testItem(){
    return Container(
        child: Column(
          children: List.generate(_testList.length, (index) => Container(
            child:Container(
              height: 40,
              margin: EdgeInsets.only(left: 16,right: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryTextTheme.headline4.color
                      )
                  )
              ),
              child: Container(
                child: Text(_testList[index],
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "medium",
                      color: Theme.of(context).accentTextTheme.headline3.color
                  ),),
              ),
            ) ,
          )),
        )
    );
  }
  //Tests Items
  Container checkUpItem(){
    return Container(
        child: Column(
          children: List.generate(_checkUpList.length, (index) => Container(
            child:Container(
              height: 40,
              margin: EdgeInsets.only(left: 16,right: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryTextTheme.headline4.color
                      )
                  )
              ),
              child: Container(
                child: Text(_checkUpList[index],
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "medium",
                      color: Theme.of(context).accentTextTheme.headline3.color
                  ),),
              ),
            ) ,
          )),
        )
    );
  }
  ScrollController _scrollController;
  bool isTitle = false;
  Color _text =Colors.transparent;
  myfung(){
    _scrollController = ScrollController()
      ..addListener(
            () => _isAppBarExpanded ?
        _text != Theme.of(context).textTheme.caption.color ?
        setState(
              () {
            _text = Theme.of(context).textTheme.caption.color;
            isTitle = true;
           // _icon = Theme.of(context).textTheme.caption.color;
           // theme= true;
            print(
                'setState is called');
          },
        ):{

        }
            : _text != Colors.transparent ?
        setState((){
          print('setState is called');
          _text = Colors.transparent;
          isTitle = false;
          //_icon = Theme.of(context).textTheme.bodyText1.color;
        }):{},

      );
  }
  @override
  void initState() {
    super.initState();
    myfung();
  //  _pageController = PageController();
  }
  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (188 - kToolbarHeight);
  }
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MediaQuery(
      data: queryData.copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: Scaffold(
            body:CustomScrollView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  expandedHeight: 188,
                  leading: isTitle? Transform.translate(
                    offset: Offset(-8.0,0.0),
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
                  ): //back btn
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 16,top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //back btn
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).textTheme.subtitle2.color.withOpacity(0.9)
                            ),
                            child: Image.asset(
                              "assets/icons/ic_back.png",
                              scale: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Basic health examination",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "medium",
                        fontWeight: FontWeight.w700,
                        color: _text
                      ),),
                    background: Image.asset("assets/imgs/libartry_img.jpg",fit: BoxFit.cover,),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                        [
                          _buildWidget()
                        ]
                    )
                )
              ],
            ),
          bottomNavigationBar: BottomAppBar(
            elevation: 4,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Price",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline2.color
                              ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            child: Text("\$ 1200",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline1.color
                              ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  MaterialButton(
                    height: 44,
                    minWidth:145,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(context, SlidePageRoute(page: YourBillingScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(6)),
                    color:  Theme.of(context).accentTextTheme.headline1.color,
                    elevation: 0,
                    highlightElevation: 0,
                    child: Container(
                      child: Text(
                        "Book now",
                        style: TextStyle(
                            color:  Theme.of(context).textTheme.subtitle2.color,
                            fontSize: 14,
                            fontFamily: 'medium'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Appbar
  Widget appBar(){
    return   //Img
      Container(
        width: double.infinity,
        height: 188,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/imgs/libartry_img.jpg")
            )
        ),
        child:   Container(
          height: 50,
          padding: EdgeInsets.only(left: 16,top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //back btn
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).textTheme.subtitle2.color.withOpacity(0.9)
                  ),
                  child: Image.asset(
                    "assets/icons/ic_back.png",
                    scale: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget _buildWidget(){
    return Container(
      child: Column(
        children: [
          //Space
          SizedBox(height: 4,),
          //Basic health examination
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            alignment: Alignment.centerLeft,
            child: Text("Basic health examination",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color
              ),),
          ),
          //Space
          SizedBox(height: 10,),
          //Lorem ipsun dolor...
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            child: Text("Lorem ipsum dolor sit amet, consec adipiscing elit. "
                "Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
                "Ut massa lorem, viverra sed sadales ac, lacinia ac dolor. In "
                "ultricies, libero nec pellentesque tincidunt, orci mi vehicula ex, "
                "sed tristique metus diam ullamcorper dui.",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline3.color
              ),),
          ),
          //Space
          SizedBox(height: 12,),
          //wrap
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Theme.of(context).accentTextTheme.subtitle2.color.withOpacity(0.3)
                            ),
                            child: Row(
                              children: [
                                Image.asset("assets/icons/ic_gender2.png",scale: 30,),
                                Container(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text("Any gender",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                        color: Theme.of(context).accentTextTheme.subtitle2.color
                                    ),),
                                )
                              ],
                            ),
                          )),
                      //Space
                      SizedBox(width: 8,),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Theme.of(context).accentTextTheme.headline5.color.withOpacity(0.3)
                            ),
                            child: Row(
                              children: [
                                Image.asset("assets/icons/ic_cake.png",scale: 30,),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text("Any age",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                        color: Theme.of(context).accentTextTheme.headline5.color
                                    ),),
                                )
                              ],
                            ),
                          )),
                      //Space
                      SizedBox(width: 8,),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Theme.of(context).accentTextTheme.headline1.color.withOpacity(0.3)
                            ),
                            child: Row(
                              children: [
                                Image.asset("assets/icons/ic_test_b.png",scale: 30,),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text("13 Tests",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "medium",
                                        color: Theme.of(context).accentTextTheme.headline1.color
                                    ),),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                //Space
                SizedBox(height: 10,),
                //4 Categories check-up
                Row(
                  children: [
                    Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Theme.of(context).accentTextTheme.headline6.color.withOpacity(0.3)
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/ic_file.png",scale: 30,),
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: Text("4 Categories check-up",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline6.color
                              ),),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Price Book now btn
          Container(
            height: 75,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryTextTheme.headline3.color
                  ),
                  bottom: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryTextTheme.headline3.color
                  ),
                )
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Price",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline2.color
                            ),),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 4),
                          child: Text("\$ 1200",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline1.color
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
                //
                MaterialButton(
                  height: 44,
                  minWidth:145,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(context, SlidePageRoute(page: YourBillingScreen()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(6)),
                  color:  Theme.of(context).accentTextTheme.headline1.color,
                  elevation: 0,
                  highlightElevation: 0,
                  child: Container(
                    child: Text(
                      "Book now",
                      style: TextStyle(
                          color:  Theme.of(context).textTheme.subtitle2.color,
                          fontSize: 14,
                          fontFamily: 'medium'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Your benefit
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            alignment: Alignment.centerLeft,
            child: Text("Your benefit",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color
              ),),
          ),
          //Space
          SizedBox(height: 20,),
          //Take sample
          Container(
            padding: EdgeInsets.only(left: 13,right: 16),
            child: Row(
              children: [
                Container(
                  child: Image.asset("assets/icons/ic_house.png",scale: 8,),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Container(
                          child: RichText(
                            text: TextSpan(
                                text: "Take sample at your home ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline3.color
                                ),
                                children: [
                                  TextSpan(
                                    text: "FOR FREE",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context).accentTextTheme.headline1.color
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
                        //
                        Container(
                          padding: EdgeInsets.only(top: 6),
                          child: Text("Our nurse'll come and take sample at your home.",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline3.color
                            ),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Doctor consult....
          Container(
            padding: EdgeInsets.only(left: 13,right: 16),
            child: Row(
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
                        //
                        Container(
                          child: RichText(
                            text: TextSpan(
                                text: "Dear consult online ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "medium",
                                    color: Theme.of(context).accentTextTheme.headline3.color
                                ),
                                children: [
                                  TextSpan(
                                    text: "FOR FREE",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "medium",
                                        color: Theme.of(context).accentTextTheme.headline1.color
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
                        //
                        Container(
                          padding: EdgeInsets.only(top: 6),
                          child: Text("Get advice from our reputable and\nprofessional doctors.",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline3.color
                            ),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Result send...
          Container(
            padding: EdgeInsets.only(left: 13,right: 16),
            child: Row(
              children: [
                Container(
                  child: Image.asset("assets/icons/ic_mobile.png",scale: 8,),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: "Result send straight to you mobile ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context).accentTextTheme.headline3.color
                              ),
                            ),
                          ),
                        ),
                        //
                        Container(
                          padding: EdgeInsets.only(top: 6),
                          child: Text("Check-up result will be send to your\nphone immediately.",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "medium",
                                color: Theme.of(context).accentTextTheme.headline3.color
                            ),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Divider
          Divider(
            height: 1,
            color: Theme.of(context).primaryTextTheme.headline3.color,
            thickness: 1,
          ),
          //Space
          SizedBox(height: 20,),
          //Our process
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            alignment: Alignment.centerLeft,
            child: Text("Our process",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color
              ),),
          ),
          //Space
          SizedBox(height: 8,),
          //1
          Container(
            padding: EdgeInsets.only(left: 14,right: 16),
            child: Row(
              children: [
                Image.asset("assets/icons/ic_one.png",scale: 20,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Our nurse come to your place to talke sample.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'medium',
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  ),
                )
              ],
            ),
          ),
          //Divider
          verticalDivider(),
          //2
          Container(
            padding: EdgeInsets.only(left: 14,right: 16),
            child: Row(
              children: [
                Image.asset("assets/icons/ic_two.png",scale: 20,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Bring your sample to health facilities to analyze.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'medium',
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  ),
                )
              ],
            ),
          ),
          //Divider
          verticalDivider(),
          //3
          Container(
            padding: EdgeInsets.only(left: 14,right: 16),
            child: Row(
              children: [
                Image.asset("assets/icons/ic_three.png",scale: 20,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Result send to your phone through EVEC app.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'medium',
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  ),
                )
              ],
            ),
          ),
          //Divider
          verticalDivider(),
          //4
          Container(
            padding: EdgeInsets.only(left: 14,right: 16),
            child: Row(
              children: [
                Image.asset("assets/icons/ic_four.png",scale: 20,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Our doctor will contact and give you consult.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'medium',
                          color: Theme.of(context).accentTextTheme.headline3.color
                      ),),
                  ),
                )
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Divider
          Divider(
            height: 6,
            color: Theme.of(context).primaryTextTheme.headline3.color,
            thickness: 6,
          ),
          SizedBox(height: 20,),
          //Our 13 test
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            alignment: Alignment.centerLeft,
            child: Text("Our 13 test",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color
              ),),
          ),
          //Space
          SizedBox(height: 10,),
          testItem(),
          //Space
          SizedBox(height: 20,),
          //Our 4 categories check-up
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            alignment: Alignment.centerLeft,
            child: Text("Our 4 categories check-up",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "medium",
                  color: Theme.of(context).accentTextTheme.headline2.color
              ),),
          ),
          //Space
          SizedBox(height: 10,),
          checkUpItem(),
          //Space
          SizedBox(height: 80,),
        ],
      ),
    ) ;
  }


  Container verticalDivider(){
    return  //Divider
      Container(
        height: 30,
        padding: EdgeInsets.only(left: 25),
        child: Row(
          children: [
            VerticalDivider(
              width: 2,
              thickness: 2,
              indent: 2,
              endIndent: 2,
              color: Theme.of(context).accentTextTheme.headline5.color,
            ),
          ],
        ),
      );
  }
}
