import 'dart:async';

import 'package:base_project/model/login_model.dart';
import 'package:base_project/network/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  @override
  LoginBlocState get initialState => LoginBlocInitial();

  @override
  Stream<LoginBlocState> mapEventToState(
    LoginBlocEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield* _loginAction(event.loginModelRequest);
    }

  }
}

Stream<LoginBlocState> _loginAction(LoginModel request) async* {
  ApiProvider _apiProvider = ApiProvider();

  yield LoginWaiting();
  try {
    LoginModel data = await _apiProvider.login(request);
    yield LoginSuccess(loginModel: data);
  } catch (ex) {
    print(ex.toString()) ; 
    yield LoginError(errorMessage: ex.message.toString());
  }
}
