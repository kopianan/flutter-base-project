part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<Post> listPost;
  PostLoaded({
    this.listPost,
  });
}

class PostError extends PostState {
  final String errorMessage;
  PostError({
    this.errorMessage,
  });
}

class PostWaiting extends PostState {}
