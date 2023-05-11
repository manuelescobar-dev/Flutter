import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/models/device.dart';
import 'package:hydro/pages/Home.dart';
import 'package:hydro/models/plant.dart';
import 'package:hydro/services/database.dart';
import 'package:hydro/services/deviceError.dart';
import 'package:hydro/shared/caudal.dart';
import 'package:hydro/shared/deviceName.dart';
import 'package:hydro/shared/ec.dart';
import 'package:hydro/shared/light.dart';
import 'package:hydro/shared/ph.dart';
import 'package:hydro/shared/plantListDevice.dart';

import 'myplantPage.dart';

class mydevicePage extends StatefulWidget {
  String deviceId;
  mydevicePage({Key key, this.deviceId}) : super(key: key);
  @override
  _mydevicePageState createState() => _mydevicePageState();
}

class _mydevicePageState extends State<mydevicePage> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child:
                Container(height: 100, child: plantListDevice(widget.deviceId)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                  child: Row(
                    children: [
                      name(widget.deviceId),
                      SizedBox(
                        width: 10,
                      ),
                      deviceIconPage(widget.deviceId)
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.lightGreen[700],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: deviceError(widget.deviceId)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 20),
                  child: Row(
                    children: [
                      ph(widget.deviceId),
                      Expanded(
                          child: SizedBox(
                        width: 2,
                      )),
                      ec(widget.deviceId),
                      Expanded(
                          child: SizedBox(
                        width: 2,
                      )),
                      light(widget.deviceId),
                      Expanded(
                          child: SizedBox(
                        width: 2,
                      )),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: caudal(widget.deviceId)),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.lightGreen[700],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: IconButton(
                  icon: Icon(
                    CupertinoIcons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: (context),
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(
                              "Do you want to delete?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Cancel"),
                                isDestructiveAction: true,
                                onPressed: () => Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            mydevicePage(
                                      deviceId: widget.deviceId,
                                    ),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                ),
                              ),
                              CupertinoDialogAction(
                                  child: Text("Yes"),
                                  isDefaultAction: true,
                                  onPressed: () {
                                    deleteDevice(widget.deviceId);
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                Home(),
                                        transitionDuration:
                                            Duration(seconds: 0),
                                      ),
                                    );
                                  }),
                            ],
                          );
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
