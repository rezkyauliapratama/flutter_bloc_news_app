import 'package:flutter/material.dart';
import 'stories_bloc.dart';

class StoriesProvider extends InheritedWidget{
  final StoriesBloc bloc = StoriesBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  StoriesProvider({Key key, Widget child}) : super(key: key, child: child);

  static StoriesBloc of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(StoriesProvider) as StoriesProvider).bloc;
  }
}