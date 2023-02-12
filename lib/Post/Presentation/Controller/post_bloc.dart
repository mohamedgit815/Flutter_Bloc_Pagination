import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/Core/UseCase/base_use_case.dart';
import 'package:flutter_pagination_bloc/Core/Utils/enum.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Entities/post_entities.dart';
import 'package:flutter_pagination_bloc/Post/Domain/UseCase/posts_usecase.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Controller/post_event.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Controller/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostsBloc extends Bloc<PostEvent , PostState> {

  final PostsUseCase postUseCase ;


  PostsBloc(this.postUseCase) : super(const PostState()) {

    on<PostEvent>(_postBloc);

  }

  FutureOr<void> _postBloc(PostEvent event, Emitter<PostState> emit) async {
    final Either<Failure , List<PostEntities>> result = await postUseCase(const NoParameters());

    return result.fold(
            (l) => emit(state.copyWith( postsState: RequestsState.error , postsMessage: l.message ))
        ,
            (r) => emit(state.copyWith( postsState: RequestsState.loaded , getPosts: r ))
    );

  }


}