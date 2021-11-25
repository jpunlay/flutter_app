import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      '261501057690-qb1gcm5vo7khsikle5oeov9bro89rrh0.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size(275, 20),
  primary: const Color.fromRGBO(255, 255, 255, 1),
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

class Login extends StatefulWidget {
  final Function setIsLoggedIn;
  const Login({Key? key, required this.setIsLoggedIn}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();

  static _Login? of(BuildContext context) =>
      context.findAncestorStateOfType<_Login>();
}

class _Login extends State<Login> {
  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      widget.setIsLoggedIn(true);
      print(googleSignInAccount!.displayName);
    } catch (error) {
      print(error);
    }
  }

  Widget _buildBody() {
    ElevatedButton googleButton = ElevatedButton(
      style: buttonStyle,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            'assets/images/icons/google/google.png',
            height: 30,
            width: 30,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(width: 12),
          const DefaultTextStyle(
              style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 1)),
              child: Text('Sign in with Google')),
        ],
      ),
      onPressed: _handleSignIn,
    );

    ElevatedButton appleButton = ElevatedButton(
      style: buttonStyle,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            'assets/images/icons/apple/apple.png',
            height: 30,
            width: 30,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(width: 12),
          const DefaultTextStyle(
              style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 1)),
              child: Text('Sign in with Apple ')),
        ],
      ),
      onPressed: _handleSignIn,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 400, 20, 20),
          child: Text('Sign in', style: TextStyle(fontSize: 22)),
        ),
        googleButton,
        const SizedBox(height: 20),
        appleButton
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _buildBody(),
    );
  }
}
