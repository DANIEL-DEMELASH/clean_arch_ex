import 'package:dio/dio.dart';

import '../models/post_model.dart';

class PostAPIService {
  Future <List<PostModel>> getPosts() async {
    Dio dio = Dio();
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    
      if(response.statusCode == 200){
        List<PostModel> posts = (response.data as List).map((postJson) => PostModel.fromJson(postJson)).toList();
        return posts;  
      } else {
      throw Exception('Failed to load posts. Status code: ${response.statusCode}');
    }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }

  }
}