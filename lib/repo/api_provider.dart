import 'dart:convert';
import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/sources.dart';
import 'package:http/http.dart';

class ApiProvider extends Sources {
  static const String api = "https://hacker-news.firebaseio.com/v0";
  Client client = Client();

  @override
  fetchTopIds() async {
    final response = await client.get("$api/topstories.jsony");
    final id = jsonDecode(response.body);
    return id;
  }

  @override
  fetchItem(int id) async {
    final response = await client.get("$api/item/$id.json");
    final content = jsonDecode(response.body);
    return ItemModel.fromJson(content);
  }

  @override
  Future<int> insertItem(ItemModel item) {
    return null;
  }
}
