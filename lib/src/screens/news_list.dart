import 'package:flutter/material.dart';
import 'dart:async';
import '../blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';

class NewsList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, snapshot){
        if (!snapshot.hasData){
          return Text('still waiting on ids');
        }

        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return Text(snapshot.data[index].toString());
            }
        );
      },
    );
  }



}