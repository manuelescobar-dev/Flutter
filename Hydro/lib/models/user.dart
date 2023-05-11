import 'package:hydro/models/device.dart';

import 'plant.dart';

class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  List<Plant> userPlants;
  List<Device> userDevices;

  UserData({this.uid, this.userPlants, this.userDevices});
}
