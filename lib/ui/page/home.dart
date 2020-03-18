import 'package:base_project/bloc/post_bloc/post_bloc.dart';
import 'package:base_project/network/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PostBloc _postBloc;
  @override
  void initState() {
    _postBloc = BlocProvider.of<PostBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                      color: Colors.grey,
                      child: BlocBuilder<PostBloc, PostState>(
                        bloc: _postBloc,
                        builder: (context, state) {
                          if (state is PostWaiting) {
                            return _loadingCenter();
                          }
                          if (state is PostError) {
                            return Container(
                              child: Text(state.errorMessage),
                            );
                          }
                          if (state is PostLoaded) {
                            return _listPostData(state);
                          }
                          if (state is PostInitial) {
                            return Container(
                              child: Center(child: Text("Press the button")),
                            );
                          }
                        },
                      ))),
              Container(
                child: RaisedButton(
                  child: Text("Get Data From Internet"),
                  onPressed: () {
                    _postBloc.add(GetListPost());
                  },
                ),
              )
            ],
          )),
    );
  }

  Container _loadingCenter() {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  ListView _listPostData(PostLoaded state) {
    return ListView.builder(
        itemCount: state.listPost.length,
        itemBuilder: (context, index) {
          return Card(
                      child: ListTile(
              title: Text(state.listPost[index].title),
            ),
          );
        });
  }
}
