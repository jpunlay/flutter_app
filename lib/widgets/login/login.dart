import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/login/apple_button.dart';
import 'package:flutter_app/widgets/login/google_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();
  static _Login? of(BuildContext context) =>
      context.findAncestorStateOfType<_Login>();
}

class _Login extends State<Login> {
  GoogleSignInAccount? _currentUser;
  set string(GoogleSignInAccount value) => setState(() => _currentUser = value);

  String _contactText = '';

  Widget _buildBody() {
    if (_currentUser != null) {
      GoogleSignInAccount user = _currentUser!;

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
                onPressed: () {} // _handleSignOut,
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
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.fromLTRB(20, 400, 20, 20),
              child: Text('Sign in', style: TextStyle(fontSize: 22))),
          GoogleButton(user: (user) => setState(() => _currentUser = user)),
          const SizedBox(height: 20),
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
