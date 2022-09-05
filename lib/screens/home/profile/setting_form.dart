import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/auth.dart';
import '../../../utils/shared.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          SizedBox(
            width: 1000,
            child: TextButton(onPressed: () async {
              await _auth.signOut();
              if (!mounted) {
                return;
              }
              Navigator.pop(context);

              }, child: Text('Log out')),
          )
        ],
      ),
    );
  }
}
