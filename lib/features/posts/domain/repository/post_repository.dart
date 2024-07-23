import 'package:clean_arch_ex/features/posts/domain/enitities/post_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class PostRepository {
  Future <DataState<List<PostEntity>>> getPosts();
}