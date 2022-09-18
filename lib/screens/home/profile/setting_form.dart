import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:utmcssa_app/screens/home/profile/create_post.dart';

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
      child: Column(
        children: [
          ElevatedButton(onPressed: () {
            }, child: const Text("Temperary Test Button")),
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
