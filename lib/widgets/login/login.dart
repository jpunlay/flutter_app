import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/login/apple_button.dart';
import 'package:flutter_app/widgets/login/google_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      '261501057690-qb1gcm5vo7khsikle5oeov9bro89rrh0.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();
}

Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

class _Login extends State<Login> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        print(_currentUser);
      });
      if (_currentUser != null) {
        // _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              leading: GoogleUserCircleAvatar(
                identity: user,
              ),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
            ElevatedButton(
              child: Text(user.toString()),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text('SIGN OUT'),
              onPressed: _handleSignOut,
            ),
            // ElevatedButton(
            //   child: const Text('REFRESH'),
            //   onPressed: () => _handleGetContact(user),
            // ),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(20, 400, 20, 20),
              child: Text('Sign in', style: TextStyle(fontSize: 22))),
          GoogleButton(),
          SizedBox(height: 20),
          AppleButton()
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: _buildBody(),
      ),
    );
  }
}
