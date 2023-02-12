import 'package:flutter_pagination_bloc/PaginationPost/Domain/Entities/pagination_post_entities.dart';

class PaginationPostModel extends PaginationPostEntities {

  const PaginationPostModel({required super.id, required super.title, required super.body});

  factory PaginationPostModel.fromJson(Map<String,dynamic>json){
    return PaginationPostModel(
        id: json['id'] ,
        title: json['title'] ,
        body: json['body']
    );
  }

}