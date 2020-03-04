import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/api_provider.dart';
import 'package:flutter_news_app_bloc/repo/db_provide.dart';
import 'package:flutter_news_app_bloc/repo/sources.dart';

class Respository {
  List<Sources> sources = [
    DbProvider(),
    ApiProvider(),
  ];

  fetchTopIds() async {
    return await sources[1].fetchTopIds();
  }

  fetchItem(int id) async {
    ItemModel item;
    var source;
    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }
    for (var origin in sources) {
      if (source != origin) {
        origin.insertItem(item);
      }
    }
    return item;
  }
}
