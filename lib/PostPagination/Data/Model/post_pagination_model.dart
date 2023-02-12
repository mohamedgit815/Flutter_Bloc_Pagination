import 'package:flutter_pagination_bloc/PostPagination/Domain/Entities/post_pagination_entities.dart';

class PostPaginationModel extends BasePostPaginationEntities {

  const PostPaginationModel({required super.id, required super.title, required super.body});

  factory PostPaginationModel.fromJson(Map<String,dynamic>json){
    return PostPaginationModel(
        id: json['id'] ,
        title: json['title'] ,
        body: json['body']
    );
  }

}