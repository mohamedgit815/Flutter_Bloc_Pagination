import 'package:equatable/equatable.dart';
import 'package:flutter_pagination_bloc/Core/Utils/enum.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Entities/post_entities.dart';

class PostState extends Equatable {

  final List<PostEntities> getPosts;
  final RequestsState postsState;
  final String postsMessage;

  const PostState({
    this.getPosts = const [],
    this.postsState = RequestsState.loading,
    this.postsMessage = '',
  });


  PostState copyWith({
    List<PostEntities>? getPosts ,
    RequestsState? postsState ,
    String? postsMessage ,
  }) {
    return PostState(
      getPosts: getPosts ?? this.getPosts ,
      postsState: postsState ?? this.postsState ,
      postsMessage: postsMessage ?? this.postsMessage ,
    );
  }


  @override
  List<Object?> get props => [
    getPosts , postsState , postsMessage ,
  ];

}