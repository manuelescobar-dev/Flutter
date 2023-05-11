import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/pages/Home.dart';

class deviceSettingsPage extends StatefulWidget {
  @override
  _deviceSettingsPageState createState() => _deviceSettingsPageState();
}

class _deviceSettingsPageState extends State<deviceSettingsPage> {
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
                pageBuilder: (context, animation1, animation2) => Home(),
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
