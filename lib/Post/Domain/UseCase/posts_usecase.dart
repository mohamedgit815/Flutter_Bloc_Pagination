import 'package:dartz/dartz.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/Core/UseCase/base_use_case.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Entities/post_entities.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Repository/base_post_respository.dart';

class PostsUseCase extends BaseUseCase<List<PostEntities> , NoParameters > {
  final BasePostRepository basePostRepository;

  PostsUseCase(this.basePostRepository);

  @override
  Future<Either<Failure, List<PostEntities>>> call(parameters) async {
    return await basePostRepository.getPosts();
  }





}