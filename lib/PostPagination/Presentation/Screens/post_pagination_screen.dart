import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc/PostPagination/Data/DataSource/posts_pagination_data_source.dart';
import 'package:flutter_pagination_bloc/PostPagination/Presentation/Controller/post_pagination_bloc.dart';
import 'package:flutter_pagination_bloc/PostPagination/Presentation/Controller/post_pagination_event.dart';
import 'package:flutter_pagination_bloc/PostPagination/Presentation/Controller/post_pagination_state.dart';

class PostPaginationScreen extends StatelessWidget {
  const PostPaginationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: RepositoryProvider<BasePostPaginationDataSource>(
          create: (BuildContext context) => PostPaginationDataSource() ,
        child: BlocProvider(
            create: (BuildContext context) => PostPaginationBloc(context.read<BasePostPaginationDataSource>())
              ..add(PostFetchPaginationEvent()) ,

          child: BlocBuilder<PostPaginationBloc , PostPaginationState>(

            builder: (BuildContext context,PostPaginationState state) {
             if(state is PostLoadingPaginationState) {
               return const Center(child: CircularProgressIndicator.adaptive());
             } else if(state is PostPaginationSuccessState) {
               return ListView.builder(
                   controller: context.read<PostPaginationBloc>().scrollController ,
                   itemCount: state.post!.length ,
                   itemBuilder: (context,i)=>ListTile(
                     leading: Text(state.post!.elementAt(i).id.toString()),
                     title: Text(state.post!.elementAt(i).title.toString()),
                     subtitle: Text(state.post!.elementAt(i).body.toString()),
                   ));
             } else {
               return Container();
             }
            },
          ),
        ),
      ),
    );
  }
}
