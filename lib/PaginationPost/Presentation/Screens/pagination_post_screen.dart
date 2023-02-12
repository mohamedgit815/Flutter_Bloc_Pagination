import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Data/DataSource/pagination_posts_data_source.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Presentation/Controller/pagination_bloc.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Presentation/Controller/pagination_event.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Presentation/Controller/pagination_state.dart';



class PaginationPostScreen extends StatefulWidget {
  const PaginationPostScreen({Key? key}) : super(key: key);

  @override
  State<PaginationPostScreen> createState() => _PaginationPostScreenState();
}

class _PaginationPostScreenState extends State<PaginationPostScreen> {



  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BasePaginationPostDataSource>(

      create: (BuildContext context) => PaginationPostDataSource() ,

      child: BlocProvider(
          create: (BuildContext context)=>PaginationPostBloc(context.read<BasePaginationPostDataSource>())
            ..add(FetchPaginationPostEvent()) ,
      child: Scaffold(

        body: BlocBuilder<PaginationPostBloc , PaginationPostState>(
          builder: (BuildContext context , PaginationPostState state) {


            if(state is PaginationPostLoadingState) {

              return const Center(child: CircularProgressIndicator.adaptive());

            } else if(state is PaginationPostSuccessState) {


              final List<PaginationPostEntities>? posts = state.post;

              return ListView.builder(
                controller: context.read<PaginationPostBloc>().scrollController ,
                  itemCount: context.read<PaginationPostBloc>().isLoadMore ? posts!.length + 1 : posts!.length,
                  itemBuilder: (context,int i ){
                    if(i > posts.length) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    } else {
                      PaginationPostEntities data = posts[i];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text(i.toString()),),
                          title: Text(data.title),
                          subtitle: Text(data.body),
                        ),
                      );
                    }
              }
              );
            } else {
              return Container();
            }
          }
        ),
      ),
      )
    );
  }
}
