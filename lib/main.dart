import 'package:flutter/material.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_Bloc_Provider.dart';
import 'Screen/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hacker News App',
      theme: ThemeData.dark(),
      home: NewsBlocProvider(
        child: NewsScreen(),
      ),
    );
  }
}
