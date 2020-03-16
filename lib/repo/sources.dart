import 'package:flutter_news_app_bloc/models/item-model.dart';

abstract class Sources {
  Future<List<int>> fetchTopIds();

  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> insertItem(ItemModel item);

  Future<int> clearData();
}
