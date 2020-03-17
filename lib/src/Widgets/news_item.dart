import 'package:flutter/material.dart';
import 'package:flutter_news_app_bloc/Screen/test.dart';
import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/src/Widgets/loading_container.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_BLOC.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_Bloc_Provider.dart';
import 'package:shimmer/shimmer.dart';

class NewsItem extends StatelessWidget {
  final int id;

  NewsItem({this.id});

  @override
  Widget build(BuildContext context) {
    final NewsBloc bloc = NewsBlocProvider.of(context);
    return StreamBuilder(
        stream: bloc.itemStream,
        builder:
            (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
          if (!snapshot.hasData) {
            return LoadingContainer();
          }
          return FutureBuilder(
            future: snapshot.data[id],
            builder: (context, AsyncSnapshot<ItemModel> sn) {
              if (!sn.hasData) {
                return LoadingContainer();
              }
              return buildItem(sn.data, context);
            },
          );
        });
  }

  Widget buildItem(ItemModel data, BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(
                title: data.title,
              )),
        );
      },
      title: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10.0),
        child: Container(
            height: 100.0,
            width: double.infinity,
            child: Card(
                elevation: 2.0,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 8.0, left: 22.0, right: 5.0),
                      child: Text(
                        data.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 65.0,
                      left: 25.0,
                      child: Text(
                        "The total socre for this article is ${data.score.toString()}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 22.0,
                      top: 45.0,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.comment,
                          ),
                          Text("${data.descendants}")
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
