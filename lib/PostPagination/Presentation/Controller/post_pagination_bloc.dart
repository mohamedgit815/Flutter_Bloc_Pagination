import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc/PostPagination/Data/DataSource/posts_pagination_data_source.dart';
import 'package:flutter_pagination_bloc/PostPagination/Domain/Entities/post_pagination_entities.dart';
import 'package:flutter_pagination_bloc/PostPagination/Presentation/Controller/post_pagination_event.dart';
import 'package:flutter_pagination_bloc/PostPagination/Presentation/Controller/post_pagination_state.dart';



class PostPaginationBloc extends Bloc<PostPaginationEvent , PostPaginationState> {
  int page = 1;
  final ScrollController scrollController = ScrollController();

  BasePostPaginationDataSource postPaginationDataSource;

  PostPaginationBloc(this.postPaginationDataSource) : super(InitPostPaginationState(null)) {

    scrollController.addListener(() {
      add(PostLoadMorePaginationEvent());
    });

    on<PostFetchPaginationEvent>((event, emit) async {
      emit(PostLoadingPaginationState(null));

      final List<BasePostPaginationEntities> data = await postPaginationDataSource.getPosts(limit: 10, page: page);

      emit(PostPaginationSuccessState(data));
    });


    on<PostLoadMorePaginationEvent>((event, emit) async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
         page++;

        final List<BasePostPaginationEntities> posts = await postPaginationDataSource.getPosts(limit: 10, page: page);

        emit(PostPaginationSuccessState([...state.post! , ...posts]));
      }
    });

  }



}