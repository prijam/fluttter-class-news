import 'dart:async';
import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/reprository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = Respository();

  BehaviorSubject<List<int>> _topId = BehaviorSubject<List<int>>();
  BehaviorSubject<Map<int, Future<ItemModel>>> _itemStream =
      BehaviorSubject<Map<int, Future<ItemModel>>>();

  BehaviorSubject<int> _itemId = BehaviorSubject<int>();

  Function(int) get itemId => _itemId.sink.add;

  Stream<Map<int, Future<ItemModel>>> get itemStream => _itemStream.stream;

  NewsBloc() {
    _itemId.stream.transform(_itemTransform()).pipe(_itemStream);
  }

  fetchTopId() async {
    final list = await _repository.fetchTopIds();
    _topId.sink.add(list);
  }

  _itemTransform() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel>> cache, int id, index) {
      cache[id] = _repository.fetchItem(id);
      print("This is called upto $index times");
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  clearData() async {
    return _repository.clearData();
  }

  Stream<List<int>> get topId => _topId.stream;

  close() {
    _topId.close();
    _itemId.close();
    _itemStream.close();
  }
}
