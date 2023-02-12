import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/Core/UseCase/base_use_case.dart';
import 'package:flutter_pagination_bloc/PostPagination/Domain/Entities/post_pagination_entities.dart';
import 'package:flutter_pagination_bloc/PostPagination/Domain/Repository/base_post_pagination_respository.dart';


class PostsPaginationUseCase extends BaseUseCase<List<BasePostPaginationEntities> , PostPaginationParameters > {
  final BasePostPaginationRepository postPaginationRepository;

  PostsPaginationUseCase(this.postPaginationRepository);

  @override
  Future<Either<Failure, List<BasePostPaginationEntities>>> call(PostPaginationParameters parameters) async {
    return await postPaginationRepository.getPosts(page: parameters.page,limit: parameters.limit);
  }

}

class PostPaginationParameters extends Equatable {
  final int limit , page;

  const PostPaginationParameters({required this.limit , required this.page});


  @override
  List<Object?> get props => [limit , page];
}