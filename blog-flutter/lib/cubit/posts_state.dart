part of 'posts_cubit.dart';

@immutable
sealed class PostsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsLoaded extends PostsState {
  final List<Post> posts;
  PostsLoaded(this.posts);
  @override
  List<Object?> get props => [posts, posts.length];
  copyWith({List<Post>? posts}) {
    return PostsLoaded(posts ?? this.posts);
  }
}
