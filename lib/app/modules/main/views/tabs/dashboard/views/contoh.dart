// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class CardItem {
//   String productImg;
//   String productName;

//   CardItem({this.productImg, this.productName});
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   List<CardItem> cards = [
//     CardItem(productImg: "https://picsum.photos/250?image=9", productName: "a"),
//     CardItem(
//         productImg: "https://picsum.photos/250?image=10", productName: "b"),
//     CardItem(
//         productImg: "https://picsum.photos/250?image=11", productName: "c"),
//     CardItem(
//         productImg: "https://picsum.photos/250?image=12", productName: "d"),
//     CardItem(
//         productImg: "https://picsum.photos/250?image=13", productName: "e"),
//     CardItem(
//         productImg: "https://picsum.photos/250?image=14", productName: "f"),
//     CardItem(
//         productImg: "https://picsum.photos/250?image=15", productName: "g"),
//     CardItem(productImg: "https://picsum.photos/250?image=16", productName: "h")
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.shopping_cart),
//               onPressed: () {},
//             )
//           ],
//           backgroundColor: Colors.green,
//         ),
//         /* drawer: Drawer(
//           child: AppDrawer(),
//         ),*/
//         body: SingleChildScrollView(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   child: Text("HomeSlider()"),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
//                   child: Text('leatest_producrs',
//                       style: TextStyle(
//                           color: Theme.of(context).accentColor,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700)),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 8.0),
//                   height: 200.0,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: cards.length,
//                     itemBuilder: (BuildContext context, int index) => Card(
//                       child: InkWell(
//                         child: Column(
//                           children: [
//                             Flexible(
//                               child: Container(
//                                 height: double.infinity,
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                   image: NetworkImage(
//                                     cards[index].productImg,
//                                   ),
//                                   fit: BoxFit.fitHeight,
//                                 )),
//                               ),
//                             ),
//                             Container(
//                               width: 150,
//                               padding: EdgeInsets.all(10),
//                               child: Text(cards[index].productName,
//                                   style: new TextStyle(fontSize: 12),
//                                   softWrap: true),
//                             ),
//                           ],
//                         ),
//                         onTap: () {},
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
//                     child: Image(
//                       fit: BoxFit.cover,
//                       image: AssetImage('assets/images/banner-1.jpg'),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
//                       child: Text('Featured Products',
//                           style: TextStyle(
//                               color: Theme.of(context).accentColor,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           right: 8.0, top: 8.0, left: 8.0),
//                       child: RaisedButton(
//                           color: Theme.of(context).primaryColor,
//                           child: Text('View All',
//                               style: TextStyle(color: Colors.white)),
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/categorise');
//                           }),
//                     )
//                   ],
//                 ),
//                 Container(
//                   child: GridView.count(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     crossAxisCount: 2,
//                     padding:
//                         EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
//                     children: List.generate(cards.length, (index) {
//                       return Container(
//                         child: Card(
//                           clipBehavior: Clip.antiAlias,
//                           child: InkWell(
//                             onTap: () {
//                               print('Card tapped.');
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Flexible(
//                                   child: Container(
//                                     height: double.infinity,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                       image: NetworkImage(
//                                         cards[index].productImg,
//                                       ),
//                                       fit: BoxFit.fitHeight,
//                                     )),
//                                   ),
//                                 ),
//                                 ListTile(
//                                     title: Text(
//                                   cards[index].productName,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 12),
//                                 )),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         top: 6.0, left: 8.0, right: 8.0, bottom: 10),
//                     child: Image(
//                       fit: BoxFit.cover,
//                       image: AssetImage('assets/images/banner-2.jpg'),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
