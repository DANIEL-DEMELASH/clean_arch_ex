import 'package:clean_arch_ex/core/resources/data_state.dart';
import 'package:clean_arch_ex/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_event.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostEvent, PostState>{
  final GetPostsUsecase _getPostsUsecase;
  
  PostsBloc(this._getPostsUsecase) :super (LoadingPosts() ) {
    on<GetPostsEvent>((event, emit) async{
      final dataState = await _getPostsUsecase.call();
      
      if(dataState is DataSuccess){
        emit(LoadedPosts(dataState.data!));
      }
      
      else if(dataState is DataFailed){
        emit(ErrorPosts(dataState.error!));
      }
    });
  }
}