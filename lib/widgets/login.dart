import 'package:flutter/material.dart';
import 'dart:developer' as developer;


class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>_Login();
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
          const Text("You are not currently signed in."),
          ElevatedButton(
            child: const Text('SIGN IN'),
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