import 'package:flutter/material.dart';
import 'package:flutter_news_app_bloc/HomePage/HomePage.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App",
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
      home: Scaffold(

        body: HomePage(),
      ),
    );
  }
}
