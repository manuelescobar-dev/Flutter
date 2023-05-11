import 'package:flutter/material.dart';

class products extends StatefulWidget {
  const products({Key? key}) : super(key: key);

  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Products"),
    );
  }
}
