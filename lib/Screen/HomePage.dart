import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.indigo[700],
        child: _buildNewsList(context),

      ),
    );
  }

 Widget _buildNewsList(BuildContext context) {
    return Center(
      child: Text("Hello world",style: TextStyle(
        color: Colors.white,
        fontSize: 30.0
      ),),
    );
 }
}
