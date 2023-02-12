import 'package:flutter_pagination_bloc/PostPagination/Domain/Entities/post_pagination_entities.dart';


abstract class PostPaginationState {
  final List<BasePostPaginationEntities>? post;

  PostPaginationState(this.post);
}


class InitPostPaginationState extends PostPaginationState {
  InitPostPaginationState(super.post);
}

class PostLoadingPaginationState extends PostPaginationState {
  PostLoadingPaginationState(super.post);
}

class PostPaginationSuccessState extends PostPaginationState {
  PostPaginationSuccessState(super.post);
}