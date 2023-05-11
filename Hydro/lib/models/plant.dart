import 'package:flutter/material.dart';

class Plant {
  PlantType type;
  DateTime planted;

  void getRemainingDays() {}

  Plant({
    this.type,
    this.planted,
  });
}

class PlantType {
  String plantName;
  double harvestTime;
  String description;
  NetworkImage image;

  PlantType({
    this.plantName,
    this.harvestTime,
    this.description,
    this.image,
  });
}

final lettuce = PlantType(
    plantName: "Lettuce",
    harvestTime: 30,
    description: "Its a plant",
    image: NetworkImage(
        "https://thegraphicsfairy.com/wp-content/uploads/2014/04/Vintage-Garden-Image-Lettuce-GraphicsFairy.jpg"));
final spinach = PlantType(
    plantName: "Spinach",
    harvestTime: 30,
    description: "Its a plant",
    image: NetworkImage(
        "https://maemae.de/wp-content/uploads/2020/05/Spinat.png"));

List<PlantType> plantTypeList = [lettuce, spinach];

List<String> plantTypeNames = [lettuce.plantName, spinach.plantName];
