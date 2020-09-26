import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final name, lastname;

  const Profile({
    Key key,
    this.name,
    this.lastname,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Text(
          "${widget.name} ${widget.lastname}",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
