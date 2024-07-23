import 'package:clean_arch_ex/features/posts/domain/enitities/post_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable{
  final List<PostEntity>? posts;
  final DioException? error;
  
  const PostState({this.posts, this.error});
  
  @override
  List<Object?> get props {
   return [
    posts!,
    error!
   ]; 
  }
}

class LoadingPosts extends PostState {}

class LoadedPosts extends PostState {
  const LoadedPosts(List<PostEntity> posts) : super(posts: posts);
}

class ErrorPosts extends PostState{
  const ErrorPosts(DioException error) : super(error: error);
}

