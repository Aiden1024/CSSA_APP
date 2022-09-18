import 'package:flutter/material.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/services/database.dart';

import '../../../models/post.dart';
import '../../../utils/app_styles.dart';
import 'package:gap/gap.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: Text("公告"),
      ),
      body: FutureBuilder(
        future: DatabaseService(widget.post.uid).getUserData(),
        builder: (context, AsyncSnapshot<UserProfile>snapshot) {
          if (snapshot.hasData) {
            UserProfile? uP = snapshot.data;
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: Styles.standardHorizontalMargin, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post.title, style: Styles.headLineStyle1,),
                    const Gap(30),
                    Text(uP!.formalName, style: Styles.headLineStyle2),
                    Text(widget.post.date, style: Styles.headLineStyle3),

                    const Gap(10),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: Styles.standardHorizontalMargin),
                        child: Text(widget.post.mainText, style: Styles.textStyle)),

                  ],
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }

        }
      ),

    );
  }
}
