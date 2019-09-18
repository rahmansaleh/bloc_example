import 'package:bloc_example/bloc/user_bloc.dart';
import 'package:bloc_example/model/user.dart';
import 'package:bloc_example/model/user_response.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: new SafeArea(
        child: new StreamBuilder(
          stream: bloc.subject.stream,
          builder: (BuildContext context, AsyncSnapshot<UserResponse> snapshot ){

            if  (snapshot.hasData) {
              if (snapshot.data.error != null && snapshot.data.error.length > 0) {
                return _buildErrorWidget(snapshot.data.error);
              }
              return _buildUserWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.data.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        ),
      ),
      
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            "Loading Data from API..."
          ),

          CircularProgressIndicator(),

        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            error
          ),
        ],
      ),
    );
  }

  Widget _buildUserWidget(UserResponse userResponse) {
    User user = userResponse.result[0]; 
    print("_buildUserWidget userResponse: ${user} ");
    return Container();
  }

  @override
  void initState() {
    super.initState();
    bloc.getUser();
  }

  @override
  void dispose() {
    
    super.dispose();
  }
}