import 'package:flutter_pagination_bloc/Post/Domain/Entities/post_entities.dart';

class PostModel extends PostEntities {

  const PostModel({required super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String,dynamic>json){
    return PostModel(
        id: json['id'] ,
        title: json['title'] ,
        body: json['body']
    );
  }

}