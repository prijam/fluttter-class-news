import 'package:flutter/material.dart';
import 'package:flutter_news_app_bloc/main.dart';

class DetailsPage extends StatelessWidget {
  final String title;

  DetailsPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.indigo,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: Container(
            width:250.0,
            child: Text(title,overflow: TextOverflow.ellipsis,)),
      ),
      body: Card(
        elevation: 25.0,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Colors.indigo],
            )),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(left: 47.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
