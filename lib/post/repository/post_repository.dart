import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:srs6/models/get_posts.dart';
import 'package:srs6/post/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//скачивает файл из сети по ссылке и превращает его в дарт версию
class PostRepository {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";
//запрос к серверу
  Future<void> getPosts(GetPostEvent event, Emitter<PostState> emit) async {
    emit(LoadingPostState()); //начало процесса
    try {
      final response = await http.get(Uri.parse(baseUrl)); //гет запрос к апи
      if (response.statusCode == 200) { //вариация события - успех
      //превращаем текст ответа в json и после в объект пост
        final List<dynamic> jsonList = jsonDecode(response.body);
        final getPosts = jsonList.map((json) => Posts.fromJson(json)).toList(); 
        //отправляет в блок посты
        emit(FetchedPostsState(getPosts));
      } else { ///вариация события - провал
        emit(FailurePostState());
      }
    } catch (e) { //при отсутствии интернета
      emit(FailurePostState());
    }
  }
}