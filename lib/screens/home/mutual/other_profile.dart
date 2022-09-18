import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:utmcssa_app/screens/home/profile/setting_form.dart';
import 'package:utmcssa_app/services/database.dart';
import 'package:utmcssa_app/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:utmcssa_app/utils/loading.dart';
import '../../../models/user.dart';
import '../../../models/user_profile.dart';
import '../../../services/storage_service.dart';
import '../../../utils/shared.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../profile/post_card_list.dart';

class OtherProfile extends StatefulWidget {
  OtherProfile({Key? key, required this.uP}) : super(key: key);
  final UserProfile uP;

  @override
  State<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  @override
  Widget build(BuildContext context) {

    String username = widget.uP.username;
    String formalName = widget.uP.formalName;
    String bio = widget.uP.bio;
    String departments = Shared.depCodeListToString(widget.uP.departments);
    String picUrl = "";

    bool profilePicLoaded = false;


    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingForm(),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(
            username,
            style: Styles.headLineStyle2,
          ),
          centerTitle: false,
          elevation: 0,
          shape: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
          backgroundColor: Styles.bgColor,
          actions: [
            IconButton(
              onPressed: _showSettingPanel,
              icon: Icon(Icons.menu),
              color: Colors.black87,
            )
          ],
        ),
        body: Container(
          // margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 8)),
                    child: InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {},
                      child: FutureBuilder(
                        future: widget.uP.pic,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            picUrl = snapshot.data.toString();
                          }

                          if (picUrl != "") {
                            profilePicLoaded = true;
                          }
                          return Ink(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),)],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: profilePicLoaded ? NetworkImage(picUrl) : const AssetImage(
                                    'assets/images/default_profile_pic.jpg') as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                  Text(
                    formalName,
                    style: Styles.headLineStyle2,
                  ),
                  Text(
                    bio,
                    style: Styles.headLineStyle4,
                  ),
                  const Gap(20),
                  Text(
                    "部门",
                    style: Styles.headLineStyle2,
                  ),
                  Text(departments),
                  const Gap(20),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: ElevatedButton(

                                  onPressed: null, child: Text('发布公告'))),
                        ),
                        Expanded(
                          child: Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),

                                onPressed: null, child: Text('编辑信息', style: TextStyle(color: Colors.black87),), )),
                        ),
                        Container(

                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),

                                onPressed: null,
                                child: Icon(Icons.change_circle_outlined)))],
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 1,
                    indent: 4,
                    endIndent: 4,
                  ),
                  Text(
                    "我的公告",
                    style: Styles.headLineStyle2,
                  ),
                  PostCardList(postList: [],)
                ],
              ),
            ),
          ),
        ));
  }
}
