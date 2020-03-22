import 'package:base_project/bloc/login_bloc/login_bloc_bloc.dart';
import 'package:base_project/model/login_model.dart';
import 'package:base_project/ui/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _loginBlocBloc = BlocProvider.of<LoginBlocBloc>(context); 
    return Scaffold(
        appBar: AppBar(),
        body: 
        BlocListener<LoginBlocBloc, LoginBlocState>(
          bloc: _loginBlocBloc,
          listener: (context, state) {
            if (state is LoginError) {
              Fluttertoast.showToast(msg: state.errorMessage);
            }
            if (state is LoginSuccess) {
              Fluttertoast.showToast(msg: "Success Login");
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            }
          },
          child: 
          Container(
            child: Center(
                child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
              bloc: _loginBlocBloc,
              builder: (context, state) {
                if (state is LoginWaiting) {
                  return CircularProgressIndicator();
                }
                if (state is LoginError) {
                  return _loginButton(_loginBlocBloc);
                }
                if (state is LoginSuccess) {
                  return _loginButton(_loginBlocBloc);
                }
                return _loginButton(_loginBlocBloc);
              },
            )),
          ),
        ));
  }

  RaisedButton _loginButton(LoginBlocBloc bloc) {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () {
        LoginModel loginRequestData = LoginModel(password: "password", username: "Username");

        bloc.add(LoginEvent(loginModelRequest: loginRequestData));
      },
    );
  }
}
