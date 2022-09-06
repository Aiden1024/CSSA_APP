import 'package:flutter/material.dart';
import 'package:utmcssa_app/screens/home/post_card_list.dart';
import 'package:utmcssa_app/screens/home/profile/setting_form.dart';
import 'package:utmcssa_app/services/database.dart';
import 'package:utmcssa_app/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:utmcssa_app/utils/loading.dart';
import '../../../models/user.dart';
import '../../../models/user_profile.dart';
import '../../../utils/shared.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);

    String username = '加载中...';
    String formalName = '加载中...';
    String bio = '加载中...';
    String departments = '加载中...';

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
          // set data
          UserProfile up = snapshot.data as UserProfile;
          // setState of having data

          username = up.username;
          formalName = up.formalName;
          bio = up.bio;
          print("DEBUGG!!!");
          print(up.departments);
          departments = Shared.depCodeListToString(up.departments);
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
                            customBorder: new CircleBorder(),
                            onTap: () {}, // Handle your callback.
                            splashColor: Colors.transparent,
                            child: Ink(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/default_profile_pic.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                        Row(
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
                                    
                                      onPressed: () {}, child: Text('编辑信息', style: TextStyle(color: Colors.black87),), )),
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

                                    onPressed: () {},
                                    child: Icon(Icons.change_circle_outlined)))],
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
          print("No data at the future wtf is going on ??");
          return Loading();

        }

      }
    );
  }
}
