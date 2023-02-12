import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc/Core/Utils/enum.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Entities/post_entities.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Controller/post_bloc.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Controller/post_state.dart';


BlocBuilder<PostsBloc , PostState> getPostsWidget() {
  return BlocBuilder<PostsBloc , PostState>(
      builder: (BuildContext context , PostState state) {
        switch( state.postsState ) {

          case RequestsState.loading :
            return const Center(child: CircularProgressIndicator());


          case RequestsState.loaded :
            return ListView.builder(
              key: const PageStorageKey<String>("value"),
                itemCount: state.getPosts.length ,
                itemBuilder: (BuildContext context , int i) {
                  final PostEntities data = state.getPosts.elementAt(i);
                  return ListTile(
                    key: ValueKey(data.id) ,
                    title: Text(data.title) ,
                    subtitle: Text(data.body),
                  );
                },
            );


          case RequestsState.error :
            return Center(child: Text(state.postsMessage));

        }
      }
  );
}