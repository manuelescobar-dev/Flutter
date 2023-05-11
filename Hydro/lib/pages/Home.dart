import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/pages/settings.dart';
import 'package:hydro/pages/stats.dart';
import 'package:hydro/models/plant.dart';
import 'package:hydro/services/database.dart';
import 'package:hydro/shared/plantListHome.dart';

import '../models/device.dart';
import 'mydevicePage.dart';
import 'myplantPage.dart';
import 'plantPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String newName;
    String newRef;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Profile(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
            icon: Icon(CupertinoIcons.person_crop_circle, color: Colors.black),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => StatsPage(),
              transitionDuration: Duration(seconds: 0),
            ));
          },
          icon: Icon(
            CupertinoIcons.chart_bar_alt_fill,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Hydro",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                  child: Text(
                    "My Plants",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.add),
              onPressed: () {
                _showDialog(context);
              },
            ),
          ]),
          plantListHome(),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: Text(
                      "Devices",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(CupertinoIcons.add),
                  onPressed: () {
                    showDialog(
                        context: (context),
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(
                              "Add Device",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CupertinoTextField(
                                  textCapitalization: TextCapitalization.words,
                                  clearButtonMode: OverlayVisibilityMode.always,
                                  placeholder: "Name",
                                  onChanged: (value) {
                                    newName = value;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CupertinoTextField(
                                  textCapitalization: TextCapitalization.words,
                                  clearButtonMode: OverlayVisibilityMode.always,
                                  placeholder: "Reference",
                                  onChanged: (value) {
                                    newRef = value;
                                  },
                                ),
                              ],
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Cancel"),
                                isDestructiveAction: true,
                                onPressed: () => Navigator.pop(context),
                              ),
                              CupertinoDialogAction(
                                  child: Text("Add"),
                                  isDefaultAction: true,
                                  onPressed: () {
                                    addDevice(newRef, newName);
                                    Navigator.pop(context);
                                  }),
                            ],
                          );
                        });
                  })
            ],
          ),
          StreamBuilder<QuerySnapshot>(
              stream: devices.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return Container(
                  height: 100,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        mydevicePage(deviceId: document.id),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Text(
                                document.data()['deviceName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.lightGreen[700],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: 100.0,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Text(
                "Explore",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              itemCount: plantTypeList.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              plantPage(planti: plantTypeList[Index]),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 25,
                          width: 100,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              plantTypeList[Index].plantName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: plantTypeList[Index].image,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: 100.0,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: SizedBox(
            height: 5,
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                  "Everything is okay!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                color: Colors.white,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        color: Colors.lightGreen[700]),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  String dropdownValue;
  String _chosenValue;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Add a plant"),
        content: Container(
          height: 100,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Select Plant"),
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter dropDownState) {
                return Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    underline: Container(),
                    items: <String>['lettuce', 'spinach'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      dropDownState(() {
                        dropdownValue = value;
                      });
                    },
                  ),
                );
              }),
              SizedBox(
                height: 30,
              ),
              new Text("Select Device"),
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter dropDownState) {
                return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('devices')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );

                      return Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: _chosenValue,
                          underline: Container(),
                          onChanged: (String value) {
                            dropDownState(() {
                              _chosenValue = value;
                            });
                          },
                          items: snapshot.data.docs
                              .map((DocumentSnapshot document) {
                            return DropdownMenuItem<String>(
                              value: document.id,
                              child: Text(
                                document.data()["deviceName"],
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    });
              })
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              FlatButton(
                child: new Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: new Text(
                  "Add",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  addPlant(dropdownValue, _chosenValue);
                  Navigator.pop(context);
                },
              ),
            ],
          )
          // usually buttons at the bottom of the dialo
        ],
      );
    },
  );
}
