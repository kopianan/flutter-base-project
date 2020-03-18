import 'dart:async';

import 'package:base_project/model/post.dart';
import 'package:base_project/network/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostInitial();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is GetListPost) {
      yield* _getListPost();
    }
  }
}

Stream<PostState> _getListPost() async* {
  ApiProvider _apiProvider = ApiProvider();

  yield PostWaiting();
  try {
    List<Post> data = await _apiProvider.getListPost();
    yield PostLoaded(listPost: data);
  } catch (ex) {
    yield PostError(errorMessage: ex.message.toString());
  }
}
