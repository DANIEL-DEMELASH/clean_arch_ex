import 'package:dio/dio.dart';

import '../models/post_model.dart';

class PostAPIService {
  Future <List<PostModel>> getPosts() async {
    Dio dio = Dio();
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    
    if(response.statusCode == 200){
      List<PostModel> posts = (response.data as List).map((postJson) => PostModel.fromJson(postJson)).toList();
      return posts;  
    }
    
     throw Exception();
  }
}