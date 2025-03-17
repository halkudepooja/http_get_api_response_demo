import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_get_response_demo/IModelDelegate.dart';
import 'package:http_get_response_demo/model/user.dart';


class Http_Get_Example extends StatefulWidget {
  const Http_Get_Example({super.key, required this.title});

  final String title;

  @override
  State<Http_Get_Example> createState() => _Http_Get_ExampleState();
}

class _Http_Get_ExampleState extends State<Http_Get_Example> {
  /// Makes a GET request to the specified URL and returns a list of User objects.
  ///
  /// Currently, the URL is set to https://jsonplaceholder.typicode.com/posts,
  /// which returns a list of posts. The posts are then mapped to User objects
  /// and returned.
  Future<List<User>> getRequest() async {
    //replace your restFull API here.
   // String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(IModeldelegate.postUrl));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
        id: singleUser["id"],
        userId: singleUser["userId"],
        title: singleUser["title"],
        body: singleUser["body"],
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Get Request."),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder:
                      (ctx, index) => ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].body),
                        contentPadding: EdgeInsets.only(bottom: 20.0),
                      ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
