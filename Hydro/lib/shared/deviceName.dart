import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget name(deviceID) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('devices')
        .doc(deviceID)
        .snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Text(
          "-",
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        );
      }
      var userDocument = snapshot.data;
      return Text(
        userDocument.data()["deviceName"],
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      );
    },
  );
}
