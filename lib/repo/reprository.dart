import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/api_provider.dart';
import 'package:flutter_news_app_bloc/repo/db_provide.dart';

class Respository {
  final dbProvider = DbProvider();
  final apiProvider = ApiProvider();

  fetchTopIds() async {
    return await apiProvider.fetchItem();
  }

  fetchItem(int id) async {
    ItemModel item;
    item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    } else {
      item = await apiProvider.fetchItem(id);
      if (item != null) {
        dbProvider.insertItem(item);
      } else {
        return item;
      }
    }
  }
}
