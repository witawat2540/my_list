import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'myuser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url  ="https://reqres.in/";
  var header = {HttpHeaders.contentTypeHeader: "application/json"};

  send_data_api()async{
    var user = {};
    user["email"] = "eve.holt@reqres.in";
    user["password"] = "cityslicka55";
     var req = jsonEncode(user);
    http.Response response = await http.post(url+"api/login",body: req,headers:header,);
    if(response.statusCode== 200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myuser(),));
    }
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: send_data_api,
          child: Text('Click Me'),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 10.0,
        ),
      ),
    );
  }
}
