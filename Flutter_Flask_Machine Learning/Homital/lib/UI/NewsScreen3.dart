// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:webfeed/webfeed.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class RSS extends StatefulWidget {
//   RSS() : super();
//   final String title = 'Health News';
//   @override
//   RSSState createState() => RSSState();
// }

// class RSSState extends State<RSS> {
//   static const String FEED_URL =
//       'https://www.news-medical.net/tag/feed/Skin-Cancer.aspx';
//   RssFeed _feed;
//   String _title;
//   static const String loadingFeedMsg = 'Loading Feed...';
//   static const String feedLoadErrorMsg = 'Error Loading Feed.';
//   static const String feedOpenErrorMsg = 'Error Opening Feed.';
//   static const String placeholderImg = 'assets/imgs/caronaimg.png';
//   GlobalKey<RefreshIndicatorState> _refreshKey;

//   updateTitle(title) {
//     setState(() {
//       _title = title;
//     });
//   }

//   updateFeed(feed) {
//     setState(() {
//       _feed = feed;
//     });
//   }

//   Future<void> openFeed(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: true,
//         forceWebView: false,
//       );
//       return;
//     }
//     updateTitle(feedOpenErrorMsg);
//   }

//   load() async {
//     updateTitle(loadingFeedMsg);
//     loadFeed().then((result) {
//       if (null == result || result.toString().isEmpty) {
//         updateTitle(feedLoadErrorMsg);
//         return;
//       }
//       updateFeed(result);
//       updateTitle(_feed.title);
//     });
//   }

//   Future<RssFeed> loadFeed() async {
//     try {
//       // ignore: unused_local_variable
//       final client = http.Client();
//       final response = await client.get(Uri.parse(FEED_URL));
//       return RssFeed.parse(response.body);
//     } catch (e) {
//       //
//     }
//     return null;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _refreshKey = GlobalKey<RefreshIndicatorState>();
//     updateTitle(widget.title);
//     load();
//   }

//   title(title) {
//     return Text(
//       title,
//       style: TextStyle(
//           fontSize: 18.0,
//           fontWeight: FontWeight.w500,
//           overflow: TextOverflow.ellipsis,
//           fontFamily: 'medium',
//           color: Theme.of(context).accentTextTheme.headline2.color),
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     );
//   }

//   subtitle(subTitle) {
//     return Text(
//       subTitle,
//       style: TextStyle(
//           fontSize: 14.0,
//           fontWeight: FontWeight.w100,
//           overflow: TextOverflow.ellipsis,
//           fontFamily: 'medium',
//           color: Theme.of(context).accentTextTheme.headline2.color),
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     );
//   }

//   // thumbnail(imageUrl) {
//   //   return Padding(
//   //     padding: EdgeInsets.only(left: 15.0),
//   //     child: CachedNetworkImage(
//   //       placeholder: (context, url) => Image.asset(placeholderImg),
//   //       imageUrl: imageUrl,
//   //       height: 50,
//   //       width: 70,
//   //       alignment: Alignment.center,
//   //       fit: BoxFit.fill,
//   //     ),
//   //   );
//   // }

//   rightIcon() {
//     return Icon(
//       Icons.keyboard_arrow_right,
//       color: Colors.grey,
//       size: 30.0,
//     );
//   }

//   list() {
//     return ListView.builder(
//       itemCount: _feed.items.length,
//       itemBuilder: (BuildContext context, int index) {
//         final item = _feed.items[index];

//         return ListTile(
//           title: title(item.title),
//           subtitle: subtitle(item.pubDate),
//           // leading: thumbnail(item.enclosure.url),
//           trailing: rightIcon(),
//           contentPadding: EdgeInsets.all(5.0),
//           onTap: () => openFeed(item.link),
//         );
//       },
//     );
//   }

//   isFeedEmpty() {
//     return null == _feed || null == _feed.items;
//   }

//   body() {
//     return isFeedEmpty()
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : RefreshIndicator(
//             key: _refreshKey,
//             child: list(),
//             onRefresh: () => load(),
//           );
//   }

//   MediaQueryData queryData;
//   @override
//   Widget build(BuildContext context) {
//     queryData = MediaQuery.of(context);
//     return MediaQuery(
//         data: queryData.copyWith(textScaleFactor: 1.0),
//         child: SafeArea(
//           child: Scaffold(
//               body: Container(
//                   child: Column(
//             children: [
//               //Appbar
//               Container(
//                 height: 50,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     //back btn
//                     Positioned.directional(
//                       textDirection: Directionality.of(context),
//                       start: -4,
//                       top: 0,
//                       bottom: 0,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Image.asset(
//                             "assets/icons/ic_back.png",
//                             scale: 30,
//                           ),
//                         ),
//                       ),
//                     ),
//                     //title
//                     Positioned.directional(
//                       textDirection: Directionality.of(context),
//                       top: 0,
//                       bottom: 0,
//                       start: 0,
//                       end: 0,
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           _title,
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'medium',
//                               color: Theme.of(context)
//                                   .accentTextTheme
//                                   .headline2
//                                   .color),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(height: 20),
//               Container(
//                 child: body(),
//               )
//             ],
//           ))),
//         ));
//   }

//   //Continue coding here

// }
