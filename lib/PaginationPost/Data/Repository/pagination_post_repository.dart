import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/error_message_model.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Data/DataSource/pagination_posts_data_source.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Repository/base_pagination_post_respository.dart';


class PaginationPostRepository extends BasePaginationPostRepository {
  final BasePaginationPostDataSource paginationPostDataSource;

  PaginationPostRepository(this.paginationPostDataSource);

  @override
  Future<Either<Failure, List<PaginationPostEntities>>> getPosts(int page) async {

    final List<PaginationPostEntities> result = await paginationPostDataSource.getPosts(page);

    try{
      return Right(result);
    } on ErrorMessageModel catch(e) {
      return Left(ServerFailure(e.statusMessage));
    }
  }

}