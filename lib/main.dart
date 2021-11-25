import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/login/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(
    const MaterialApp(
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isLoggedIn = false;
  GoogleSignInAccount? googleSignInAccount;

  void _setIsLoggedIn(bool value) {
    setState(() {
      _isLoggedIn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn == false) {
      return Scaffold(
        body: Login(setIsLoggedIn: _setIsLoggedIn),
      );
    } else {
      // Load application here:
      return Scaffold(
        appBar: AppBar(
          title: const Text('Signed in'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: const Text('Signed In'),
        ),
      );
    }
  }
}
