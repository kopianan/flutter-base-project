part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetListPost extends PostEvent {}

class GetListPostLimit extends PostEvent {}
