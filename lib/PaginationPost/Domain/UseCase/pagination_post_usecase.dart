import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pagination_bloc/Core/Error/failure.dart';
import 'package:flutter_pagination_bloc/Core/UseCase/base_use_case.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Repository/base_pagination_post_respository.dart';


class PaginationPostUseCase extends BaseUseCase<List<PaginationPostEntities> , PaginationPostParameters > {
  final BasePaginationPostRepository basePostRepository;

  PaginationPostUseCase(this.basePostRepository);

  @override
  Future<Either<Failure, List<PaginationPostEntities>>> call(PaginationPostParameters parameters) async {
    return await basePostRepository.getPosts(parameters.page);
  }

}

class PaginationPostParameters extends Equatable {
  final int page;

  const PaginationPostParameters({required this.page });


  @override
  List<Object?> get props => [ page];
}