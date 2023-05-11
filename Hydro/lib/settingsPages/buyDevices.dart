import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/pages/Home.dart';
import 'package:hydro/pages/settings.dart';

class buyDevicesPage extends StatefulWidget {
  @override
  _buyDevicesPageState createState() => _buyDevicesPageState();
}

class _buyDevicesPageState extends State<buyDevicesPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          "Coming Soon...",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
    );
  }
}
