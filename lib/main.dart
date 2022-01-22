import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/login/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

const Color black = Color.fromRGBO(0, 0, 0, 1);

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
  GoogleSignInAccount? _userAccount;

  void _setIsLoggedIn(bool value) {
    setState(() {
      _isLoggedIn = value;
    });
  }

  void _setUserAccount(GoogleSignInAccount account) {
    setState(() {
      _userAccount = account;
    });
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _userAccount;
    if (_isLoggedIn == true && user != null) {
      // Load application here
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              leading: GoogleUserCircleAvatar(
                identity: user,
              ),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: black,
        // Login page
        body: Login(
            setIsLoggedIn: _setIsLoggedIn, setUserAccount: _setUserAccount),
      );
    }
  }
}
