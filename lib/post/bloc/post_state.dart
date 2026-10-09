part of 'post_bloc.dart';

//состояние экрана событий
sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {} //начальный экран

final class LoadingPostState extends PostState {} //экран загрузки

final class FetchedPostsState extends PostState { //экран с жанными
  final List<Posts> posts;

  const FetchedPostsState(this.posts);

  @override
  List<Object> get props => [posts];
}

final class FailurePostState extends PostState {} //экран с ошибкой