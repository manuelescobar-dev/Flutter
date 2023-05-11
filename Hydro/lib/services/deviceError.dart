import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/services/database.dart';

Widget deviceError(deviceID) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('devices')
        .doc(deviceID)
        .snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Row(
          children: [
            Container(
              color: Colors.black,
              height: 60,
              width: 4,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Not Available",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )
          ],
        );
      }
      var userDocument = snapshot.data;
      return Row(
        children: [
          Container(
            color: errorColor(userDocument.data()["status"]),
            height: 60,
            width: 4,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            errorMessage(userDocument.data()["status"]),
            style: TextStyle(
                color: errorColor(userDocument.data()["status"]),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          )
        ],
      );
    },
  );
}

String errorMessage(errorCode) {
  if (errorCode == "ok") {
    return "Everything is okay\nJust working!";
  } else if (errorCode == "noNutrient") {
    return "I need more\nnutrients!";
  } else {
    return "Not coded";
  }
}

Color errorColor(errorCode) {
  if (errorCode == "ok") {
    return Colors.black;
  } else if (errorCode == "noNutrient") {
    return Colors.red;
  } else {
    return Colors.black;
  }
}

Icon errorIconPage(errorCode) {
  if (errorCode == "ok") {
    return Icon(
      CupertinoIcons.check_mark_circled_solid,
      size: 30,
      color: Colors.white,
    );
  } else if (errorCode == "noNutrient") {
    return Icon(
      CupertinoIcons.xmark_circle_fill,
      size: 30,
      color: Colors.white,
    );
  } else {
    return Icon(
      CupertinoIcons.exclamationmark_circle_fill,
      size: 30,
      color: Colors.white,
    );
  }
}

Icon errorIconCon(errorCode) {
  if (errorCode == "ok") {
    return Icon(CupertinoIcons.check_mark_circled_solid, size: 16);
  } else if (errorCode == "noNutrient") {
    return Icon(CupertinoIcons.xmark_circle_fill, size: 16);
  } else {
    return Icon(CupertinoIcons.exclamationmark_circle_fill, size: 16);
  }
}

Widget deviceIconPage(deviceID) {
  return StreamBuilder(
    stream: devices.doc(deviceID).snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Icon(
          CupertinoIcons.exclamationmark_circle_fill,
          size: 30,
          color: Colors.white,
        );
      }
      var userDocument = snapshot.data;
      return errorIconPage(userDocument.data()["status"]);
    },
  );
}

Widget deviceIconCon(deviceID) {
  return StreamBuilder(
    stream: devices.doc(deviceID).snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (!snapshot.hasData) {
        print("nodata");
        return Icon(CupertinoIcons.exclamationmark_circle_fill, size: 16);
      }
      var userDocument = snapshot.data;
      return errorIconCon(userDocument.data()["status"]);
    },
  );
}
