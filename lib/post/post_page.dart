import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srs6/models/get_posts.dart';
import 'package:srs6/post/bloc/post_bloc.dart';


//как выглядят данные в приложении
class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Posts> posts = [];
  late PostBloc postBloc;

  @override
  void initState() {
    super.initState();
    postBloc = PostBloc(); //создание экземпляра блока
    postBloc.add(GetPostEvent()); //отправка события постов
  }

  @override
  void dispose() {
    postBloc.close(); //закрытие блоков поста  и удаление
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ), // перерисовывает интерфейс
      body: BlocBuilder<PostBloc, PostState>(
        bloc: postBloc,
        builder: (BuildContext context, state) {
          //состояние экрана загрузки
          if (state is LoadingPostState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //состояние экрана со списком
          if (state is FetchedPostsState) {
            posts = state.posts;
            return buildBody();
          } else {
            //состояние ошибки
            return const Center(
              child: Text("Some Error"),
            );
          }
        },
      ),
    );
  }
//как выглядит список
  Widget buildBody() {
    List<Widget> children = [];
    for (var item in posts) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(item.body),
              const Divider(), //разделитель
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }
}