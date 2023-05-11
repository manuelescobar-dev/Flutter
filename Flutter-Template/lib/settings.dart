import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:template/main.dart';
import 'package:template/home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class settingsScreen extends StatefulWidget {
  const settingsScreen({ Key? key }) : super(key: key);

  @override
  _settingsScreenState createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => home()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () async{
                await _signOut();
              },
            icon: Icon(Icons.check)),
        ],
      ),
      body: Text('${user?.uid} signed in.')
      );}
    Future<void> _signOut() async {
    final User? user = _auth.currentUser;
    await _auth.signOut();
    print('${user?.uid} has successfully signed out.');
    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AuthTypeSelector()));
  }
  }
