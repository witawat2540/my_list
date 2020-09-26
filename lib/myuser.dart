import 'dart:io';

import 'package:app_day2/Mystring.dart';
import 'package:app_day2/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'my_card.dart';
import 'mymodel/my_user.dart';

class Myuser extends StatefulWidget {
  @override
  _MyuserState createState() => _MyuserState();
}

class _MyuserState extends State<Myuser> {
  // String url = "https://reqres.in/";
  // var header = {HttpHeaders.contentTypeHeader: "application/json"};
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List<Datum> user = [];

  Future getUser() async {
    http.Response response = await http
        .get(My_String().url + "api/users?page=2", headers: My_String().header);
    setState(() {
      user = myUserModelFromJson(response.body).data;
    });
  }

  @override
  void initState() {
    getUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("My User"),
      ),
      body: user.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) => My_card(
                firstname: user[index].firstName,
                email: user[index].email,
                avatar: user[index].avatar,
                ontap: () {
                  // _globalKey.currentState.showSnackBar(SnackBar(
                  //   elevation: 10,
                  //   content: Text(
                  //     "${user[index].firstName} ${user[index].lastName}",
                  //     style: TextStyle(fontSize: 15),
                  //   ),
                  // ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                          name: user[index].firstName,
                          lastname: user[index].lastName,
                        ),
                      ));
                },
              ),
            ),
    );
  }
}
