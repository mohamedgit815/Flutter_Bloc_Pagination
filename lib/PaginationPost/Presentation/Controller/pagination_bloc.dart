import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Data/DataSource/pagination_posts_data_source.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Presentation/Controller/pagination_event.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Presentation/Controller/pagination_state.dart';


class PaginationPostBloc extends Bloc<PaginationPostEvent , PaginationPostState> {
  int page = 1;
  bool isLoadMore = false;
  final ScrollController scrollController = ScrollController();

  BasePaginationPostDataSource paginationPostDataSource;

  PaginationPostBloc(this.paginationPostDataSource) : super(InitPaginationState(null)) {

    scrollController.addListener(() {
      add(LoadMorePaginationEvent());
    });


    on<FetchPaginationPostEvent>((event, emit) async {
      emit(PaginationPostLoadingState(null));

      final List<PaginationPostEntities> posts = await paginationPostDataSource.getPosts(page);

      emit(PaginationPostSuccessState(posts));
    });


    on<LoadMorePaginationEvent>((event, emit) async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        isLoadMore = true;
        page++;

        final List<PaginationPostEntities> posts = await paginationPostDataSource.getPosts(page);


        emit(PaginationPostSuccessState([...state.post! , ...posts]));
      }
    });
  }
}