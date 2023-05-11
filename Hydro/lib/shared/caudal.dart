import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget caudal(deviceID) {
  return Container(
    height: 70,
    width: 70,
    decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('devices')
            .doc(deviceID)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Column(
              children: [
                Text(
                  "-",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "m3/s",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            );
          }
          var userDocument = snapshot.data;
          return Column(
            children: [
              Text(
                userDocument.data()["caudal"].toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "m3/s",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          );
        },
      ),
    ),
  );
}
