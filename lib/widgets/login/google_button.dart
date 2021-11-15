import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

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
      onPressed: () {}, //_handleSignIn,
    );
  }
}
