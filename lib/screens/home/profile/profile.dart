import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:utmcssa_app/screens/home/post_card_list.dart';
import 'package:utmcssa_app/screens/home/profile/info_edit.dart';
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
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);
    final Storage storage = Storage();
    final profilePicStorageRef = FirebaseStorage.instance.ref().child("users/${appUser?.uid}/profilePic");
    UserProfile uP;

    String username = '加载中...';
    String formalName = '加载中...';
    String bio = '加载中...';
    String departments = '加载中...';
    bool profilePicLoaded = false;
    String picUrl = '';


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

    return FutureBuilder(
      future: DatabaseService(appUser!.uid).getUserData(),
      builder: (context, AsyncSnapshot<UserProfile> snapshot) {
        if (snapshot.hasData) {
          // Get User Profile Pic

          // set data
          uP = snapshot.data as UserProfile;
          // setState of having data

          username = uP.username;
          formalName = uP.formalName;
          bio = uP.bio;
          departments = Shared.depCodeListToString(uP.departments);
          return Scaffold(
              appBar: AppBar(
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
                            onTap: () async {
                              final result = await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.image,
                              );

                              if (result == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("未能选择图片"),
                                  ),
                                );
                                return null;
                              }

                              final path = result.files.single.path;
                              final fileName = result.files.single.name;

                              print(path);
                              print(fileName);

                              File file = File(path!);
                              int sizeInBytes = file.lengthSync();
                              double sizeInMb = sizeInBytes / (1024 * 1024);
                              if (sizeInMb > 3){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("选择的图像请小于3MB"),
                                  ),
                                );
                              } else {
                                storage.uploadProfilePic(file, appUser.uid).then((value) => print('>>>>>> Upload Complete <<<<<<'));
                              }



                            }, // Handle your callback.
                            // splashColor: Colors.transparent,

                            child: FutureBuilder(
                              future: storage.getPicUrl(profilePicStorageRef),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  picUrl = snapshot.data as String;
                                  if (picUrl != '') {
                                    profilePicLoaded = true;
                                  }
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
                                        onPressed: () {}, child: Text('发布公告'))),
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),

                                        onPressed: () {
                                          Get.to(() => InfoEdit(uP: uP,), arguments: [username, bio], transition: Transition.rightToLeft, duration: Duration(milliseconds: 750));
                                        }, child: Text('编辑信息', style: TextStyle(color: Colors.black87),), )),
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

                                      onPressed: () {setState(() {
                                        print("refresh");
                                      });},
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
                        PostCardList()
                      ],
                    ),
                  ),
                ),
              ));
        } else {
          print("No data at the future what is going on ??");
          return Loading();

        }

      }
    );
  }
}
