part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocEvent {}

class LoginEvent extends LoginBlocEvent {
  final LoginModel loginModelRequest;
  LoginEvent({@required this.loginModelRequest});
}
