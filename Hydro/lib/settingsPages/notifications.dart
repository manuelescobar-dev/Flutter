import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/pages/Home.dart';
import 'package:hydro/pages/settings.dart';

class notificationsPage extends StatefulWidget {
  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        /* title: Text(
          widget.planti.plantName,
          style: TextStyle(color: Colors.black),
        ), */
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Profile(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
