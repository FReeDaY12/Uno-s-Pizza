import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'my_cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.arrow_back_ios),
          title: Text(
            'Uno`s Pizza',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
          backgroundColor: Colors.blue[800],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.black87,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Material(
                    color: Color(0xffffffff),
                    child: GridView.count(
                      shrinkWrap: true,
                       crossAxisCount: 4,
                       crossAxisSpacing: 5,
                       mainAxisSpacing: 5,
                       children: <Widget>[
                       Image.asset('images/img4.jpg'),
                            Padding(padding:const EdgeInsets.all(50.0)),
                       Image.asset('images/img5.jpg'),
                            Padding(padding:const EdgeInsets.all(50.0)),
                       ],
                    ),
                  ),
                  pizza_card(
                    img: 'images/img1.jpg',

                  ),
                  pizza_card(
                    img: 'images/img2.jpg',
                  ),
                  pizza_card(

                    img: 'images/img3.jpg',
                  ),
                  pizza_card(
                    img: 'images/img6.jpg',
                  ),
                ],
              ),
            ),
          ),

        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue[800],
          backgroundColor: Color(0x000000),
          buttonBackgroundColor: Colors.red[700],
          height: 70.0,
          items: <Widget>[

            Icon(Icons.home,size: 30.0, color: Colors.white,),
            Icon(Icons.near_me,size: 30.0, color: Colors.white,),
            Icon(Icons.local_pizza,size: 40.0, color: Colors.white,),
            Icon(Icons.navigation,size:30.0, color: Colors.white,),
            Icon(Icons.location_on,size: 30.0, color: Colors.white,),
          ],
        ),
      ),
    );

  }
}

class MenuIcon {
}

class pizza_card extends StatelessWidget {
pizza_card({ this.img});

final String img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyCart(),),),
          child: Container(
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
            height: 170.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(160, 10.0, 10.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        child: Text(
                          'Pizza Medium',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Icon(FontAwesomeIcons.heart, color: Colors.white,),
                    ],
                  ),
                  Text(
                    'Medium Hand-Tossed',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        child: Text(
                          'Rp.80.000,-',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: Color(0xff1e6b00),
                            borderRadius:
                                BorderRadius.circular(10.0)),
                        alignment: Alignment.center,
                        child: Text(
                          'ORDER',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.white,
                          fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 5.0,
          bottom: 12,
          child: ClipRRect(
            child: Image(
              width: 150.0,
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
