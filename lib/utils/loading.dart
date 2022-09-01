import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:utmcssa_app/utils/app_styles.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.bgColor,
      child: Center(
        child: SpinKitChasingDots(
          color: Styles.primaryColor,
          size: 50,
        ),
      ),
    );
  }
}
