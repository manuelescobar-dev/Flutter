import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hydro/models/plant.dart';
import 'package:hydro/shared/timeRemaining.dart';

Widget harvestDateWid(plantID, PlantType plantType) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('plants')
        .doc(plantID)
        .snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Text(
          "-",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        );
      }
      var userDocument = snapshot.data;
      return Text(
        "Harvest: ${harvestDay(userDocument.data()["planted"], plantType)}",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      );
    },
  );
}
