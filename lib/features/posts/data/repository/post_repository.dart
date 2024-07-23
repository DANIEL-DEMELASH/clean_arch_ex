import 'package:clean_arch_ex/core/resources/data_state.dart';
import 'package:clean_arch_ex/features/posts/data/data_sources/post_api_service.dart';
import 'package:clean_arch_ex/features/posts/data/models/post_model.dart';
import 'package:clean_arch_ex/features/posts/domain/repository/post_repository.dart';
import 'package:dio/dio.dart';

class PostRepositoryImp extends PostRepository {
  final PostAPIService _postAPIService;
  PostRepositoryImp(this._postAPIService);
  
  @override
  Future<DataState<List<PostModel>>> getPosts() async{
    //Todo: implement api request to data source
    try {
      List<PostModel> response = await _postAPIService.getPosts();
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
  
}