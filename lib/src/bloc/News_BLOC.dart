import 'package:flutter_news_app_bloc/repo/reprository.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final _repository = Respository();
  BehaviorSubject<List<int>> _topId = BehaviorSubject<List<int>>();

  fetchTopId() async {
    final list = await _repository.fetchTopIds();
    _topId.sink.add(list);
  }

  Stream<List<int>> get topId => _topId.stream;

  close() {
    _topId.close();
  }
}
