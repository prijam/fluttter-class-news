import 'package:flutter_news_app_bloc/repo/reprository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = Respository();
  BehaviorSubject<List<int>> _topId = BehaviorSubject<List<int>>();

  PublishSubject<int> _itemId = PublishSubject<int>();

  Function(int) get itemId => _itemId.sink.add;

  fetchTopId() async {
    final list = await _repository.fetchTopIds();
    _topId.sink.add(list);
  }

  Stream<List<int>> get topId => _topId.stream;

  close() {
    _topId.close();
    _itemId.close();
  }
}
