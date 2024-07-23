import 'package:clean_arch_ex/core/resources/data_state.dart';
import 'package:clean_arch_ex/core/usecase/usecase.dart';
import 'package:clean_arch_ex/features/posts/domain/enitities/post_entity.dart';
import 'package:clean_arch_ex/features/posts/domain/repository/post_repository.dart';

class GetPostsUsecase extends Usecase<DataState<List<PostEntity>>, void>{
  final PostRepository _postRepository;
  GetPostsUsecase(this._postRepository);
  
  @override
  Future<DataState<List<PostEntity>>> call({void params}) {
    return _postRepository.getPosts();
  }
  
}