import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Entities/post_entities.dart';

abstract class BasePostRepository {
  Future<Either<Failure , List<PostEntities>>> getPosts();
}