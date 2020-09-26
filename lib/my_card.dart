import 'package:flutter/material.dart';

class My_card extends StatelessWidget {
  final String firstname, email, avatar;
  final Function ontap;

  const My_card({
    Key key,
    this.firstname,
    this.email,
    this.avatar,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: ontap,
        title: Text(firstname),
        subtitle: Text(email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage(avatar),
          // child: Image.network(user[index].avatar),
        ),
      ),
    );
  }
}