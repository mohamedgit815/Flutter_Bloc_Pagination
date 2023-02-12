import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/PostPagination/Domain/Entities/post_pagination_entities.dart';

abstract class BasePostPaginationRepository {
  Future<Either<Failure , List<BasePostPaginationEntities>>> getPosts({required int limit ,required int page});
}