import 'package:flutter/material.dart';
import 'Screen/HomePage.dart';

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
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.navigate_before,size:30.0,),
          backgroundColor: Colors.indigo[900],
          centerTitle: true,
        elevation: 100.0,
          title: Text("News App"),
        ),
        body: HomePage(),
      ),
    );
  }
}
