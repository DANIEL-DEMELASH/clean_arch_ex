import 'package:clean_arch_ex/features/posts/domain/enitities/post_entity.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_bloc.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('clean arch with bloc & rest api', style: GoogleFonts.poppins(),),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostState>(builder: (_, state){
      if(state is LoadingPosts){
        return const Center(child: CircularProgressIndicator());
      }else if(state is LoadedPosts){
        return ListView.builder(
          itemCount: state.posts!.length,
          itemBuilder: (context, index) {
          PostEntity post = state.posts![index];  
          return ListTile(
            leading: Text(post.id.toString(), style: GoogleFonts.poppins()),
            title: Text(post.title.toString(), style: GoogleFonts.poppins(), maxLines: 1,),
            subtitle: Text(post.body.toString(), style: GoogleFonts.poppins(), maxLines: 2,),
            trailing: Text(post.userId.toString(), style: GoogleFonts.poppins()),
          );
        });
      }
      return Center(
        child: Text(state.error!.toString()),
      );
    },),);
  }
}