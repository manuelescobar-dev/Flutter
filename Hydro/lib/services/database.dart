import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  void devicesList() {
    FirebaseFirestore.instance
        .collection('devices')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["deviceName"]);
      });
    });

    List getDevices() {
      FirebaseFirestore.instance
          .collection('devices')
          .get()
          .then((QuerySnapshot querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return DropdownMenuItem<String>(
            value: doc["deviceName"],
            child: new Text(
              doc["deviceName"],
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          );
        }).toList();
      });
    }
  }

  void getDevices() {
    FirebaseFirestore.instance
        .collection('devices')
        .get()
        .then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DropdownMenuItem<String>(
          value: doc["deviceName"],
          child: new Text(
            doc["deviceName"],
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        );
      }).toList();
    });
  }

  String getName(id) {
    StreamBuilder<QuerySnapshot>(
      stream: devices.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return (snapshot.data.docs[id].data()["deviceName"]);
      },
    ).toString();
  }
}
/*   String getPH(id) {
    StreamBuilder<QuerySnapshot>(
      stream: devices.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return (snapshot.data.docs[id].data()["ph"]);
      },
    ).toString();
  }
} */

Future<void> deleteDevice(deviceID) {
  plants.get().then((snapshot) {
    List<DocumentSnapshot> allDocs = snapshot.docs;
    List<DocumentSnapshot> filteredDocs = allDocs
        .where((document) => document.data()['device'] == deviceID)
        .toList();
    for (DocumentSnapshot ds in filteredDocs) {
      ds.reference
          .delete()
          .then((value) => print("Plant Deleted"))
          .catchError((error) => print("Failed to delete plant: $error"));
    }
  });
  return devices
      .doc(deviceID)
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}

Future<void> deletePlant(plantID) {
  return plants
      .doc(plantID)
      .delete()
      .then((value) => print("Plant Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}

Future<void> addPlant(type, device) {
  // Call the user's CollectionReference to add a new user

  return plants
      .add({
        'planted': Timestamp.fromDate(DateTime.now()), // John Doe
        'type': type, // Stokes and Sons
        'device': device, // 42
      })
      .then((value) => print("Plant Added"))
      .catchError((error) => print("Failed to add plant: $error"));
}

Future<void> addDevice(reference, name) {
  return devices
      .doc(reference)
      .set({
        'deviceName': name,
        'caudal': 0,
        'ec': 0,
        'light': 0,
        'ph': 0,
        'nutrientes': "ok",
        'status': "ok"
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

CollectionReference devices = FirebaseFirestore.instance.collection('devices');
CollectionReference plants = FirebaseFirestore.instance.collection('plants');
