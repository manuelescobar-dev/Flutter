import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:template/home.dart';
import 'package:template/register.dart';
import 'package:template/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: 'TEMPLATE', theme: ThemeData(), home: AuthTypeSelector()));
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthTypeSelector extends StatefulWidget {
  const AuthTypeSelector({Key? key}) : super(key: key);

  @override
  _AuthTypeSelectorState createState() => _AuthTypeSelectorState();
}

class _AuthTypeSelectorState extends State<AuthTypeSelector> {
  User? user;
  @override
  void initState() {
    _auth.userChanges().listen((event) => setState(() => user = event));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return home();
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('TEMPLATE'),
          backgroundColor: Colors.lightGreen,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amberAccent),
                ),
                child: Text('Register'),
                onPressed: () => _pushPage(context, RegisterPage()),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: () => _pushPage(context, SignInPage()),
              ),
            ),
            Text(_auth.currentUser?.uid ?? "Not signed in")
          ],
        ),
      );
    }
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
