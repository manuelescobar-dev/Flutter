import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/settingsPages/buyDevices.dart';
import 'package:hydro/settingsPages/manageDevices.dart';
import 'package:hydro/settingsPages/notifications.dart';

import 'Home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              children: [
                Container(
                  color: Colors.black,
                  height: 60,
                  width: 4,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Manuel Escobar Ferrer",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              manageDevicesPage(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 30,
                          child: Icon(
                            CupertinoIcons.pencil_outline,
                            size: 30,
                            color: CupertinoColors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Manage Devices",
                            style: TextStyle(
                                color: CupertinoColors.black, fontSize: 16),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: CupertinoColors.systemGrey4, size: 15),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              buyDevicesPage(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 30,
                          child: Icon(
                            CupertinoIcons.shopping_cart,
                            size: 30,
                            color: CupertinoColors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Buy Devices",
                            style: TextStyle(
                                color: CupertinoColors.black, fontSize: 16),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: CupertinoColors.systemGrey4, size: 15),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              notificationsPage(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 30,
                          child: Icon(
                            Icons.notification_important_outlined,
                            size: 30,
                            color: CupertinoColors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                                color: CupertinoColors.black, fontSize: 16),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: CupertinoColors.systemGrey4, size: 15),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
            child: Card(
              elevation: 0,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 30,
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30,
                        color: CupertinoColors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Cerrar Sesión",
                        style: TextStyle(
                            color: CupertinoColors.black, fontSize: 16),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: CupertinoColors.systemGrey4, size: 15),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
