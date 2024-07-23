import 'package:clean_arch_ex/features/posts/domain/enitities/post_entity.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_bloc.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<PostsBloc, PostState>(builder: (_, state){
      if(state is LoadingPosts){
        return const CircularProgressIndicator();
      }else if(state is LoadedPosts){
        return ListView.builder(
          itemCount: state.posts!.length,
          itemBuilder: (context, index) {
          PostEntity post = state.posts![index];  
          return ListTile(
            leading: Text(post.id.toString()),
            title: Text(post.title.toString()),
            subtitle: Text(post.body.toString()),
            trailing: Text(post.userId.toString()),
          );
        });
      }
      return Center(
        child: Text(state.error!.toString()),
      );
    },),);
  }
}