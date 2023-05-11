import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hydro/models/plant.dart';
import 'package:hydro/shared/timeRemaining.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget harvestProgress(plantID, PlantType plantType) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('plants')
        .doc(plantID)
        .snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Container(
          height: 30,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: LinearPercentIndicator(
              backgroundColor: Colors.white,
              width: MediaQuery.of(context).size.width - 40,
              lineHeight: 8.0,
              percent: 0,
              progressColor: Colors.black,
            ),
          ),
        );
      }
      var userDocument = snapshot.data;
      return Container(
        height: 30,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: LinearPercentIndicator(
            backgroundColor: Colors.white,
            width: MediaQuery.of(context).size.width - 40,
            lineHeight: 8.0,
            percent:
                harvestPorcentage(userDocument.data()["planted"], plantType),
            progressColor: Colors.black,
          ),
        ),
      );
    },
  );
}
