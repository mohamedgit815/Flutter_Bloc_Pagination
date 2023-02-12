import 'package:flutter_pagination_bloc/Post/Data/DataSource/posts_data_source.dart';
import 'package:flutter_pagination_bloc/Post/Data/Repository/post_repository.dart';
import 'package:flutter_pagination_bloc/Post/Domain/Repository/base_post_respository.dart';
import 'package:flutter_pagination_bloc/Post/Domain/UseCase/posts_usecase.dart';
import 'package:flutter_pagination_bloc/Post/Presentation/Controller/post_bloc.dart';
import 'package:get_it/get_it.dart';


class ServiceLocator {
  static final GetIt sl = GetIt.instance;


  void init() {
    /// Bloc
     sl.registerFactory<PostsBloc>(() => PostsBloc( sl() ));
    // sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc( sl() ));


    /// Use Cases
     sl.registerLazySingleton<PostsUseCase>(() => PostsUseCase(sl()));
    // sl.registerLazySingleton<PopularUseCase>(() => PopularUseCase(sl()));
    // sl.registerLazySingleton<TopRatedUseCase>(() => TopRatedUseCase(sl()));
    // sl.registerLazySingleton<GetDataByIdUseCase>(() => GetDataByIdUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BasePostRepository>(() => PostRepository(sl()));


    /// DataSource
    sl.registerLazySingleton<BaseDataSourcePost>(() => DataSourcePost());
  }
}