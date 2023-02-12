import 'package:flutter_pagination_bloc/Core/Error/error_message_model.dart';
import 'package:flutter_pagination_bloc/Core/Error/exception.dart';
import 'package:flutter_pagination_bloc/Post/Data/Model/post_model.dart';
import 'package:dio/dio.dart';


abstract class BaseDataSourcePost {
  Future<List<PostModel>> getPosts();
}


class DataSourcePost extends BaseDataSourcePost {


  @override
   Future<List<PostModel>> getPosts() async {

    final Response response = await Dio().getUri(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    //final Map<String,dynamic> map = response.data;
    final List<dynamic> data = response.data;

    if(response.statusCode == 200) {
      final List<PostModel> dataJson = data.map((e) => PostModel.fromJson(e)).toList();
      return dataJson;
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(response.data));
    }

  }


}