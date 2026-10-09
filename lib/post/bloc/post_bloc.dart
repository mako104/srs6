import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srs6/models/get_posts.dart';
import 'package:srs6/post/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

 
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _repository = PostRepository();
//связывает события с гет пост (типа после метода репозитория вызывает экраны событий)
  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>(_repository.getPosts);
  }
}