import 'package:flutter/material.dart';
import 'package:utmcssa_app/screens/home/profile/setting_form.dart';
import 'package:utmcssa_app/utils/app_styles.dart';
import 'package:gap/gap.dart';

import '../../../services/auth.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingForm(),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Username', style: Styles.headLineStyle2,),
        centerTitle: false,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: Colors.black12, width: 1)
        ),
        backgroundColor: Styles.bgColor,
        actions: [
          IconButton(onPressed: _showSettingPanel, icon: Icon(Icons.menu), color: Colors.black87,)
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
                    border: Border.all(color: Colors.white, width: 8)
                  ),
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
                          image: AssetImage('assets/images/default_profile_pic.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Text("Formal Name", style: Styles.headLineStyle2,),
                Text("简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介", style: Styles.headLineStyle4,),
                const Gap(20),
                Text("部门", style: Styles.headLineStyle2,),
                Text("hardcode开发者"),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(margin:EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(width: 150, child: ElevatedButton(onPressed: () {}, child: Text('发布公告')))),
                    Container(margin:EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(width: 150, child: ElevatedButton(onPressed: () {}, child: Text('编辑信息')))),

                  ],
                ),
                Divider(
                  color: Colors.black12,
                  height: 20,
                  thickness: 1,
                  indent: 4,
                  endIndent: 4,
                ),
                Text("我的公告", style: Styles.headLineStyle2,),
                Text("scroll test\n scroll test\nscroll test\nscroll test\nscroll test\nscroll test\nscroll test\nscroll test\nscroll test\nscroll test\nscroll test\n", style: Styles.headLineStyle4,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
