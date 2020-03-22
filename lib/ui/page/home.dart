
import 'package:base_project/bloc/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context); 

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
                        // bloc:postBloc,
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
                            return _listPostData(context, state);
                          }
                          if (state is PostInitial) {
                            return Container(
                              child: Center(child: Text("Press the button")),
                            );
                          }
                           return _listPostData(context, state);
                        },
                      ))),
              Container(
                child: RaisedButton(
                  child: Text("Get Data From Internet"),
                  onPressed: () {
                    postBloc.add(GetListPost());
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

  ListView _listPostData(BuildContext context, PostLoaded state) {
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
