import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Home(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
