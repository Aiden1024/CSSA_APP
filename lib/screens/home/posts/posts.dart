import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utmcssa_app/screens/home/profile/setting_form.dart';

import '../../../utils/app_styles.dart';
import '../mutual/post_card_list.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
        title: Text(
          "公告",
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
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Styles.standardHorizontalMargin, vertical: 20),
              child: Builder(
                builder: (context) {
                  return PostCardList(postList: [],);
                }
              ))
      ),

    );
  }
}
