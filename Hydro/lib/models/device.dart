import 'package:hydro/models/plant.dart';

class Device {
  String reference;
  String deviceName;
  double ph;
  double ec;
  double light;
  double caudal;
  String nutrients;
  String status;
  List<Map> plantsMap;
  List<Plant> plants() {
    var provPlants;
    for (var i; i < plantsMap.length; i++) {
      provPlants.append(Plant(planted: i.planted, type: stringToPlant(i.type)));
    }
    return provPlants;
  }

  PlantType stringToPlant(text) {
    if (text == "lettuce") {
      return lettuce;
    } else if (text == "spinach") {
      return spinach;
    }
  }

  Device(
      {this.reference,
      this.deviceName,
      this.ph,
      this.ec,
      this.light,
      this.caudal,
      this.nutrients,
      this.status,
      this.plantsMap});
}

final device1 = Device(
    deviceName: "Device 1",
    ph: 7,
    ec: 30,
    light: 70,
    caudal: 4,
    nutrients: "Yes",
    status: "Good");

List<Device> deviceList = [device1];

List<String> deviceNames = [device1.deviceName];
