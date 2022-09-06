import 'package:flutter/cupertino.dart';
import 'package:utmcssa_app/models/user.dart';
import 'package:utmcssa_app/screens/home/bottom_bar.dart';
import 'package:provider/provider.dart';
import '../utils/shared.dart';
import 'authenticate/authetication.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appUser = Provider.of<AppUser?>(context);
    // Problem with Provider and GET, there fore, back using toggle
    print("appUserDebug");
    print(appUser);
    print(appUser?.uid);
    // Return either Home or Authenticate Widget by if logged-in
    if (appUser == null) {
      return const Authenticate();
    } else {
      return BottomBar();
    }
  }
}
