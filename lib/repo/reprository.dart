import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/api_provider.dart';
import 'package:flutter_news_app_bloc/repo/db_provide.dart';
import 'package:flutter_news_app_bloc/repo/sources.dart';

class Respository {
  List<Sources> sources = [
    dbProvider,
    ApiProvider(),
  ];
  List<Cache> cache = [
    dbProvider,
  ];
  fetchTopIds() async {
    return await sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Sources source;
    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }
    for (var origin in cache) {
      if (source != origin as Sources) {
        origin.insertItem(item);
      }
    }
    return item;
  }

  clearData()  {
    var s;
    for (s in cache) {
      s.clearData();
    }
  }
}
