part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocState {}

class LoginBlocInitial extends LoginBlocState {}

class LoginSuccess extends LoginBlocState {
  final LoginModel loginModel;
  LoginSuccess({@required this.loginModel});
}

class LoginError extends LoginBlocState {
  final String errorMessage;
  LoginError({
    this.errorMessage,
  });
}

class LoginWaiting extends LoginBlocState {}
