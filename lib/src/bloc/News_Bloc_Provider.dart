import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app_bloc/src/bloc/News_BLOC.dart';

class NewsBlocProvider extends InheritedWidget {
  final _bloc = new NewsBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  NewsBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static NewsBloc of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<NewsBlocProvider>()
        ._bloc);
  }
}
