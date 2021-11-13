import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();
}

Future<void> _handleSignIn() async {
  try {
    developer.log('log me', name: 'my.app.category');
  } catch (error) {
    print(error);
  }
}

class _Login extends State<Login> {
  Widget _buildBody() {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        minimumSize: const Size(275, 20),
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 20));

    ElevatedButton googleLoginButton = ElevatedButton(
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

    ElevatedButton appleLoginButton = ElevatedButton(
      style: buttonStyle,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            'assets/images/icons/apple/apple.png',
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 12),
          const Text('Sign in with Apple'),
        ],
      ),
      onPressed: _handleSignIn,
    );
    // GoogleSignInAccount? user = _currentUser;
    // if (user != null) {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: <Widget>[
    //       ListTile(
    //         leading: GoogleUserCircleAvatar(
    //           identity: user,
    //         ),
    //         title: Text(user.displayName ?? ''),
    //         subtitle: Text(user.email),
    //       ),
    //       const Text("Signed in successfully."),
    //       Text(_contactText),
    //       ElevatedButton(
    //         child: const Text('SIGN OUT'),
    //         onPressed: _handleSignOut,
    //       ),
    //       ElevatedButton(
    //         child: const Text('REFRESH'),
    //         onPressed: () => _handleGetContact(user),
    //       ),
    //     ],
    //   );
    // } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // Wrap(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.fromLTRB(20, 400, 20, 20),
            child: Text('Sign in', style: TextStyle(fontSize: 22))),
        googleLoginButton,
        const SizedBox(height: 20),
        appleLoginButton
      ],
      // ),
    );
  }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   title: const Text('Google Sign In'),
        //   backgroundColor: Colors.white,
        // ),
        body: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _buildBody(),
    ));
  }
}
