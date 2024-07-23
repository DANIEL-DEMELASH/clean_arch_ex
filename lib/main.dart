import 'package:clean_arch_ex/features/posts/presentation/bloc/post_bloc.dart';
import 'package:clean_arch_ex/features/posts/presentation/bloc/post_event.dart';
import 'package:clean_arch_ex/features/posts/presentation/pages/posts_page.dart';
import 'package:clean_arch_ex/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (context) => sl()..add(GetPostsEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostsPage()
      ),
    );
  }
}