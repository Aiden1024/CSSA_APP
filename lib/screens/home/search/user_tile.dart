import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/screens/home/search/other_profile.dart';
import 'package:utmcssa_app/utils/app_styles.dart';
import 'package:get/get.dart';

class UserTile extends StatefulWidget {
  const UserTile({Key? key, required this.uP}) : super(key: key);
  final UserProfile uP;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {

  @override
  Widget build(BuildContext context) {
    String picUrl = "";
    bool profilePicLoaded = false;

    return FutureBuilder(
      future: widget.uP.pic,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            picUrl = snapshot.data.toString();
        }
        // if user did no upload picture, use default pics

        if (picUrl != "") {
          profilePicLoaded = true;
        }




        return Container(
          margin: EdgeInsets.zero,
          child: ListTile(
            shape: Border(
              bottom: BorderSide(width: 0.2, color: Colors.black26)
            ),
            dense: false,
            onTap: () {
              Get.to(OtherProfile(uP: widget.uP,), transition: Transition.rightToLeft, duration: Duration(milliseconds: 450));
            },
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: profilePicLoaded ? NetworkImage(picUrl) : const AssetImage(
                  'assets/images/default_profile_pic.jpg') as ImageProvider,
            ),
            title: Text(widget.uP.username),
            trailing: Text(widget.uP.formalName, style: Styles.headLineStyle4,),
          ),
        );
      }
    );
  }
}
