import 'package:flutter/material.dart';

import '../../../services/auth.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: () async {await _auth.signOut();}, child: Text('Log out'))
          ],
        ),
      ),
    );
  }
}
