import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/utils/app_styles.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.uP}) : super(key: key);
  final UserProfile uP;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: ListTile(
        shape: Border(
          bottom: BorderSide(width: 0.2, color: Colors.black26)
        ),
        dense: false,
        onTap: () {},
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
              'assets/images/default_profile_pic.jpg'),
        ),
        title: Text(uP.username),
        trailing: Text(uP.formalName, style: Styles.headLineStyle4,),
      ),
    );
  }
}
