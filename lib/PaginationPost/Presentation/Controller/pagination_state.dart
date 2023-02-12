import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';


abstract class PaginationPostState {
  final List<PaginationPostEntities>? post;

  PaginationPostState(this.post);
}


class InitPaginationState extends PaginationPostState {
  InitPaginationState(super.post);
}

class PaginationPostLoadingState extends PaginationPostState {
  PaginationPostLoadingState(super.post);
}

class PaginationPostSuccessState extends PaginationPostState {
  PaginationPostSuccessState(super.post);
}