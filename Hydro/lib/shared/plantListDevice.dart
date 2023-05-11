import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/models/plant.dart';
import 'package:hydro/pages/myplantPage.dart';
import 'package:hydro/services/database.dart';
import 'package:hydro/services/deviceError.dart';
import 'package:hydro/shared/strinExt.dart';

Widget plantListDevice(deviceID) {
  return StreamBuilder<QuerySnapshot>(
      stream: plants.where("device", isEqualTo: deviceID).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            myplantPage(
                          planti: identify(document.data()["type"]),
                          deviceID: document.data()["device"],
                          plantID: document.id,
                        ),
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
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  capitalize(document.data()["type"]),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            deviceIconCon(document.data()["device"])
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: identify(document.data()["type"]).image,
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 100.0,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      });
}

PlantType identify(type) {
  if (type == "lettuce") {
    return lettuce;
  } else if (type == "spinach") {
    return spinach;
  }
}
