import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:http/http.dart';

class ApiProvider {
  static const String api = "https://hacker-news.firebaseio.com/v0";
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get("$api/topstories.jsony");
    final id = jsonDecode(response.body);
    return debugPrint(id);
  }

  fetchItem(int id) async {
    final response = await client.get("$api/item/$id.json");
    final content = jsonDecode(response.body);
    debugPrint(content);
    return ItemModel.fromJson(content);
  }
}
