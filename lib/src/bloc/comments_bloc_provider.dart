import 'package:flutter/material.dart';

import 'comment_bloc.dart';

class CommentBlocProvider extends InheritedWidget {
  final _bloc = CommentBloc();

  CommentBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static CommentBloc of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<CommentBlocProvider>()
        ._bloc);
  }

  @override
  bool updateShouldNotify(_) => true;
}
