import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydro/models/plant.dart';

String harvestDay(planted, PlantType plantType) {
  Timestamp timestamp = planted as Timestamp;
  DateTime dateTime = timestamp.toDate();
  DateTime harvestDte =
      dateTime.add(Duration(days: plantType.harvestTime.toInt()));
  return "${harvestDte.day.toString().padLeft(2, '0')}-${harvestDte.month.toString().padLeft(2, '0')}-${harvestDte.year.toString()}";
}

double harvestPorcentage(planted, PlantType plantType) {
  Timestamp timestamp = planted as Timestamp;
  DateTime dateTime = timestamp.toDate();
  var current = dateTime.difference(DateTime.now()).inDays;
  return (-current) / (plantType.harvestTime);
}

int remainingDays(planted, PlantType plantType) {
  Timestamp timestamp = planted as Timestamp;
  DateTime dateTime = timestamp.toDate();
  var current = dateTime.difference(DateTime.now()).inDays;
  return (plantType.harvestTime + current).toInt();
}
