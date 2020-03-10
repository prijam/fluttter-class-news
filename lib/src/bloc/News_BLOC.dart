import 'dart:async';

import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/reprository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
 static final _repository = Respository();
  BehaviorSubject<List<int>> _topId = BehaviorSubject<List<int>>();

  PublishSubject<int> _itemId = PublishSubject<int>();

  Function(int) get itemId => _itemId.sink.add;

  Stream<Map<int, Future<ItemModel>>> get itemStream =>
      _topId.stream.transform(_itemTransform());

 Stream<Future<ItemModel>> get testStream => _itemId.stream.transform(_itemTransformer);

  final _itemTransformer = StreamTransformer<int,Future<ItemModel>>.fromHandlers(handleData:(id,sink) async {
    final itemModel = await _repository.fetchItem(id);
    sink.add(itemModel);
  });

  fetchTopId() async {
    final list = await _repository.fetchTopIds();
    _topId.sink.add(list);
  }

  _itemTransform() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel>> cache, int id, index) {
      cache[id] = _repository.fetchItem(id);
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  Stream<List<int>> get topId => _topId.stream;

  close() {
    _topId.close();
    _itemId.close();
  }
}
