import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/error_message_model.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/PostPagination/Data/DataSource/posts_pagination_data_source.dart';
import 'package:flutter_pagination_bloc/PostPagination/Domain/Entities/post_pagination_entities.dart';
import 'package:flutter_pagination_bloc/PostPagination/Domain/Repository/base_post_pagination_respository.dart';

class PostPaginationRepository extends BasePostPaginationRepository {
  final BasePostPaginationDataSource basePostPaginationDataSource;

  PostPaginationRepository(this.basePostPaginationDataSource);

  @override
  Future<Either<Failure, List<BasePostPaginationEntities>>> getPosts({required int limit ,required int page}) async {

    final List<BasePostPaginationEntities> result = await basePostPaginationDataSource.getPosts(page: page,limit: limit);

    try{
      return Right(result);
    } on ErrorMessageModel catch(e) {
      return Left(ServerFailure(e.statusMessage));
    }
  }
}