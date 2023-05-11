import 'package:flutter/material.dart';
import 'package:template/cart.dart';
import 'package:template/products.dart';
import 'package:template/settings.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => settingsScreen()));
              },
              icon: Icon(Icons.settings)),
        ]),
        body: Column(
          children: [
            Expanded(child: currentPage() ?? Container()),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.amberAccent,
                    child: TextButton(
                        onPressed: () {
                          if (_current == 0) {
                          } else {
                            setState(() {
                              _current = 0;
                            });
                          }
                        },
                        child: Text(
                          "Shop",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.lightBlue,
                    child: IconButton(
                      onPressed: () {
                        if (_current == 1) {
                        } else {
                          setState(() {
                            _current = 1;
                          });
                        }
                      },
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget? currentPage() {
    if (_current == 0) {
      return products();
    } else if ((_current == 1)) {
      return cart();
    }
  }
}
