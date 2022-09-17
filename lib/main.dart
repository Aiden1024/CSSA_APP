import 'package:flutter/material.dart';
import 'package:utmcssa_app/screens/wrapper.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:utmcssa_app/services/auth.dart';
import 'package:utmcssa_app/utils/app_styles.dart';

import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: GetMaterialApp(
        title: 'CSSA',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          backgroundColor: Styles.bgColor,
          primarySwatch: Colors.red,
          primaryColor: Styles.bgColor,
          appBarTheme: AppBarTheme(
            backgroundColor: Styles.bgColor,
            iconTheme: IconThemeData(color: Colors.black87),
            titleTextStyle: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w600)
          ),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.black87)
          )

        ),
        home: Wrapper(),
      ),
    );
  }
}

