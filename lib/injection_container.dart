import 'package:clean_arch_ex/features/posts/data/repository/post_repository.dart';
import 'package:clean_arch_ex/features/posts/domain/repository/post_repository.dart';
import 'package:clean_arch_ex/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/posts/data/data_sources/post_api_service.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies () async {
  sl.registerSingleton<PostAPIService>(PostAPIService());
  sl.registerSingleton<PostRepository>(PostRepositoryImp(sl()));
  sl.registerSingleton<GetPostsUsecase>(GetPostsUsecase(sl()));
  sl.registerFactory<PostsBloc>(
    () => PostsBloc(sl())
  );
}