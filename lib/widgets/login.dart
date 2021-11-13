import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class Login extends StatefulWidget {
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
        primary: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 20));

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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.fromLTRB(20, 240, 20, 20),
            child: Text('Sign in', style: TextStyle(fontSize: 22))),
        ElevatedButton(
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
        ),
      ],
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
