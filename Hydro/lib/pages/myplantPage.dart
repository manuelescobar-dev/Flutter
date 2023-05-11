import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydro/pages/Home.dart';
import 'package:hydro/models/plant.dart';
import 'package:hydro/services/database.dart';
import 'package:hydro/services/deviceError.dart';
import 'package:hydro/shared/caudal.dart';
import 'package:hydro/shared/ec.dart';
import 'package:hydro/shared/harvestDate.dart';
import 'package:hydro/shared/light.dart';
import 'package:hydro/shared/ph.dart';
import 'package:hydro/shared/progressbar.dart';
import 'package:hydro/shared/timeRemain.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:slider_button/slider_button.dart';

class myplantPage extends StatefulWidget {
  PlantType planti;
  String deviceID;
  String plantID;

  myplantPage({Key key, this.planti, this.deviceID, this.plantID})
      : super(key: key);
  @override
  _plantPageState createState() => _plantPageState();
}

class _plantPageState extends State<myplantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        /* title: Text(
          widget.planti.plantName,
          style: TextStyle(color: Colors.black),
        ), */
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Home(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            alignment: Alignment.center,
            child: Image(image: widget.planti.image),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.planti.plantName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                deviceIconPage(widget.deviceID)
                              ],
                            ),
                            harvestDateWid(widget.plantID, widget.planti),
                          ],
                        ),
                      ),
                      timeRemain(widget.plantID, widget.planti),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: harvestProgress(widget.plantID, widget.planti)),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.lightGreen[700],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: deviceError(widget.deviceID)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 20),
                  child: Row(
                    children: [
                      ph(widget.deviceID),
                      Expanded(
                          child: SizedBox(
                        width: 2,
                      )),
                      ec(widget.deviceID),
                      Expanded(
                          child: SizedBox(
                        width: 2,
                      )),
                      light(widget.deviceID),
                      Expanded(
                          child: SizedBox(
                        width: 2,
                      )),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: caudal(widget.deviceID)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: SliderButton(
                    action: () {
                      showDialog(
                          context: (context),
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                "Are you sure?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Cancel"),
                                  isDestructiveAction: true,
                                  onPressed: () => Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              myplantPage(
                                        planti: widget.planti,
                                      ),
                                      transitionDuration: Duration(seconds: 0),
                                    ),
                                  ),
                                ),
                                CupertinoDialogAction(
                                    child: Text("Yes"),
                                    isDefaultAction: true,
                                    onPressed: () {
                                      deletePlant(widget.plantID);
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1,
                                                  animation2) =>
                                              Home(),
                                          transitionDuration:
                                              Duration(seconds: 0),
                                        ),
                                      );
                                    }),
                              ],
                            );
                          });

                      ///Do something here OnSlide
                    },

                    ///Put label over here
                    label: Text(
                      "Slide to collect",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                    icon: Center(
                        child: Icon(
                      CupertinoIcons.arrow_right,
                      color: Colors.lightGreen[700],
                      size: 20.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    )),

                    ///Change All the color and size from here.
                    width: MediaQuery.of(context).size.width - 40,
                    buttonSize: 40,
                    boxShadow: BoxShadow(color: Colors.transparent),
                    shimmer: false,
                    height: 40,
                    alignLabel: Alignment(0.01, 0),
                    radius: 12,
                    buttonColor: //Colors.lightGreen[700],
                        Colors.transparent,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
