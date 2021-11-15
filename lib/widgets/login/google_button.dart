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

typedef UserCallback = void Function(GoogleSignInAccount val);

class GoogleButton extends StatelessWidget {
  final UserCallback user;

  const GoogleButton({required this.user});

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(275, 20),
      primary: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );

    return ElevatedButton(
      style: buttonStyle,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            'assets/images/icons/google/google.png',
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 12),
          const Text('Sign in with Google'),
        ],
      ),
      onPressed: _handleSignIn,
    );
  }
}
