import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

const Color darkGrey = Color.fromRGBO(36, 36, 36, 1);
const Color white = Color.fromRGBO(255, 255, 255, 1);

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Test();
}

class _Test extends State<Test> {
  late GoogleSignInAccount _userAccount;

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: GoogleUserCircleAvatar(
            identity: _userAccount,
          ),
          title: Text(_userAccount.displayName ?? ''),
          subtitle: Text(_userAccount.email),
        ),
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
