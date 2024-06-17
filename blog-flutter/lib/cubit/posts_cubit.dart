import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:blog/config/consts/const.dart';
import 'package:blog/model/post.dart';
import 'package:blog/utils/preferences.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final dio = Dio();
  PostsCubit() : super(PostsInitial()) {
    init();
  }
  Future<void> init() async {
    emit(PostsLoading());
    await fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final res = await dio.getUri(Uri.parse('$server/api/blogs'),
          options: Options(
            validateStatus: (status) => true,
          ));
      /* final posts = <Post>[];
      for (var p in res.data) {
        posts.add(Post.fromJson(p));
      } */
      final posts = List.generate(res.data.length, (index) {
        return Post.fromJson(res.data[index]);
      });

      emit(PostsLoaded(posts));
    } on Exception catch (e) {}
  }

  Future<void> comment({
    required String postId,
    required String comment,
  }) async {
    try {
      final res = await dio.putUri(Uri.parse('$server/api/blogs/$postId'),
          data: {
            'content': comment,
            "postId": postId,
            "authorId": Preferences.userId
          },
          options: Options(
            validateStatus: (status) => true,
          ));
      if (res.statusCode == 200) {
        final newComentario = Comentario.fromJson(res.data);
        final state = this.state as PostsLoaded;
        final newPosts = state.posts.map((post) {
          if (post.id == postId) {
            return post.copyWith(
              comments: [...post.comments, newComentario],
            );
          }
          return post;
        }).toList();
        emit(state.copyWith(posts: newPosts));
      }
    } on Exception catch (_) {}
  }

  Future<void> addPost(
      {required String title,
      required String content,
      required Uint8List file}) async {
    try {
      final base64Img = base64Encode(file);
      final res = await dio.postUri(Uri.parse('$server/api/blogs'),
          data: {
            'title': title,
            'content': content,
            'authorId': Preferences.userId,
            "photo": base64Img
          },
          options: Options(
            validateStatus: (status) => true,
          ));
      init();
      return;
      if (res.statusCode == 200) {
        final newPost = Post.fromJson(res.data);
        final state = this.state as PostsLoaded;
        // emit(state.copyWith(posts: [...state.posts, newPost]));
        init();
      }
    } on Exception catch (e) {
      print("el error fue: $e");
    }
  }
}
