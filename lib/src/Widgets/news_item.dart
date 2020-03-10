import 'package:flutter/material.dart';
import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_BLOC.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_Bloc_Provider.dart';

class NewsItem extends StatelessWidget {
  final int id;

  NewsItem({this.id});

  @override
  Widget build(BuildContext context) {
    final NewsBloc bloc = NewsBlocProvider.of(context);
    return StreamBuilder(
      stream: bloc.testStream,
      builder: (context, AsyncSnapshot<Future<ItemModel>> snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading...");
        }
        return FutureBuilder(
          future: snapshot.data,
          builder: (c,AsyncSnapshot<ItemModel>sn){
            if(!sn.hasData){
              return Text("Still Loading");
            }
            print("The TIITLE IS ${sn.data.title}");
            return Text(sn.data.title);
          },
        );
      },
    );
  }
}
