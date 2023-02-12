import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';


abstract class BasePaginationPostRepository {
  Future<Either<Failure , List<PaginationPostEntities>>> getPosts(int page);
}