import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/error_message_model.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/Post/Data/DataSource/posts_data_source.dart';
import 'package:flutter_pagination_bloc/Post/Data/Model/post_model.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Entities/post_entities.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Repository/base_post_respository.dart';

class PostRepository extends BasePostRepository {
  final BaseDataSourcePost basePostDataSource;

  PostRepository(this.basePostDataSource);

  @override
  Future<Either<Failure, List<PostEntities>>> getPosts() async {

    final List<PostModel> result = await basePostDataSource.getPosts();

    try{
      return Right(result);
    } on ErrorMessageModel catch(e) {
      return Left(ServerFailure(e.statusMessage));
    }
  }

}