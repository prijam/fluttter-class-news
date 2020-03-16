import 'dart:convert';
import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/sources.dart';
import 'package:http/http.dart';

class ApiProvider extends Sources {
  static const String api = "https://hacker-news.firebaseio.com/v0";
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    final response = await client.get("$api/topstories.json");
    final id = jsonDecode(response.body).cast<int>();
    return id;
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$api/item/$id.json");
    final content = jsonDecode(response.body);
    return ItemModel.fromJson(content);
  }
}
