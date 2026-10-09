part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}
//событие загрузки постов 
final class GetPostEvent extends PostEvent {}