import 'package:flutter_pagination_bloc/Core/Error/error_message_model.dart';
import 'package:flutter_pagination_bloc/Core/Error/exception.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Data/Model/pagination_post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';

abstract class BasePaginationPostDataSource {
  Future<List<PaginationPostEntities>> getPosts(int page);
}

class PaginationPostDataSource extends BasePaginationPostDataSource {


  @override
   Future<List<PaginationPostEntities>> getPosts(int page) async {

    final Response response = await Dio().getUri(Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=10'));

    //final Map<String,dynamic> map = response.data;
    final List<dynamic> data = response.data;

    if(response.statusCode == 200) {
      final List<PaginationPostEntities> dataJson = data.map((e) => PaginationPostModel.fromJson(e)).toList();
      return dataJson;
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(response.data));
    }

  }


}