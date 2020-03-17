import 'package:flutter_news_app_bloc/models/item-model.dart';
import 'package:flutter_news_app_bloc/repo/reprository.dart';
import 'package:rxdart/rxdart.dart';

class CommentBloc {
  final _repository = Respository();
  BehaviorSubject<int> _commentFetcher = BehaviorSubject<int>();
  BehaviorSubject<Map<int, Future<ItemModel>>> _commentOutput =
      BehaviorSubject<Map<int, Future<ItemModel>>>();

  //Getters for stream//

  Function(int) get commentFetcher => _commentFetcher.sink.add;

  Stream<Map<int, Future<ItemModel>>> get commentOutput =>
      _commentOutput.stream;

  CommentBloc() {
    _commentFetcher.stream.transform(_commentTransform()).pipe(_commentOutput);
  }

  _commentTransform() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
        (Map<int, Future<ItemModel>> cache, int id, int index) {
          print("The index is $index");
      cache[id] = _repository.fetchItem(id);
      cache[id].then((ItemModel item) {
        item.kids.forEach((kids) {
          commentFetcher(id);
        });
      });
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  void close() {
    _commentFetcher.close();
    _commentOutput.close();
  }
}
