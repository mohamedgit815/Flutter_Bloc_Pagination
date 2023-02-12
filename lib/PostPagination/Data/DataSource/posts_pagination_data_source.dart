import 'package:flutter_pagination_bloc/Core/Error/error_message_model.dart';
import 'package:flutter_pagination_bloc/Core/Error/exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pagination_bloc/PostPagination/Data/Model/post_pagination_model.dart';
import 'package:flutter_pagination_bloc/PostPagination/Domain/Entities/post_pagination_entities.dart';

abstract class BasePostPaginationDataSource {
  Future<List<BasePostPaginationEntities>> getPosts({required int limit ,required int page});
}

class PostPaginationDataSource extends BasePostPaginationDataSource {


  @override
   Future<List<BasePostPaginationEntities>> getPosts({required int limit ,required int page}) async {

    final Response response = await Dio().getUri(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page'));

    //final Map<String,dynamic> map = response.data;
    final List<dynamic> data = response.data;

    if(response.statusCode == 200) {
      final List<BasePostPaginationEntities> dataJson = data.map((e) => PostPaginationModel.fromJson(e)).toList();
      return dataJson;
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(response.data));
    }

  }


}