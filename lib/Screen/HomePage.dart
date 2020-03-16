import 'package:flutter/material.dart';
import 'package:flutter_news_app_bloc/src/Widgets/news_item.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_BLOC.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_Bloc_Provider.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = NewsBlocProvider.of(context);
    bloc.fetchTopId();

    return Scaffold(
      appBar: AppBar(
        title: Text("Latest news"),
      ),
      body: _buildNewsList(context, bloc),
    );
  }

  Widget _buildNewsList(BuildContext context, NewsBloc bloc) {
    return StreamBuilder(
      stream: bloc.topId,
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        return snapshot.hasData
            ? RefreshIndicator(
          onRefresh: ()async{
            await bloc.clearData();
            await bloc.fetchTopId();
          },
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    bloc.itemId(snapshot.data[index]);
                    return NewsItem(id:snapshot.data[index]);
                  }),
            )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
