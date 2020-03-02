import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_news_app_bloc/repo/api_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 40.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Hello Prijam",
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 1.0),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 15.0, top: 40.0),
                    child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(
                                    "https://scontent.fktm4-1.fna.fbcdn.net/v/t1.0-9/p960x960/58441293_2046680125442993_4916366170862387200_o.jpg?_nc_cat=108&_nc_sid=7aed08&_nc_ohc=avf9Rxre8RsAX8FKrH4&_nc_ht=scontent.fktm4-1.fna&_nc_tp=6&oh=44d61e9a370fbe947e2c263948e28905&oe=5EF2CA1C")))))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
