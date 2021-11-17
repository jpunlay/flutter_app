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
  static _Login? of(BuildContext context) =>
      context.findAncestorStateOfType<_Login>();
}

class _Login extends State<Login> {
  Future<void> _handleSignOut() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.disconnect();
    print(googleSignInAccount);
    setState(() {
      _currentUser = googleSignInAccount;
    });
  }

  GoogleSignInAccount? _currentUser;

  set string(GoogleSignInAccount value) => setState(() => _currentUser = value);

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;

    if (user != null) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(20, 200, 20, 20)),
            ListTile(
              leading: GoogleUserCircleAvatar(
                identity: user,
              ),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
            ElevatedButton(
              child: Text(user.toString(), style: TextStyle(fontSize: 20)),
              onPressed: () {},
            )
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
          // a,
          const SizedBox(height: 20),
          const AppleButton()
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
