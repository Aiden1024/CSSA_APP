import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:utmcssa_app/models/post.dart';

import '../../../services/database.dart';
import '../../../utils/app_styles.dart';
import 'package:gap/gap.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String title = "";
  String subtitle = "";
  String mainText = "";

  bool canPost() {
    if (title != "" && subtitle != "" && mainText != "") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("编辑公告"),
          centerTitle: true,
          actions: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Styles.primaryColor),
                    onPressed: canPost() ? () async {
                      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

                      dynamic result = await DatabaseService(widget.uid).databaseCreatePost(Post(title: title, mainText: mainText, date: formattedDate, pic: "", subtitle: subtitle, uid: widget.uid));
                      if (result.runtimeType == String) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("错误： ${result}"),
                          ),
                        );
                      } else {
                        print(result);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("公告已发布"),
                          ),
                        );
                      }
                      Get.back();

                    } : null,
                    child: Text("发布")))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: 30, vertical: 30),
            child: Center(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "标题",
                      style: Styles.headLineStyle3
                          .copyWith(fontWeight: FontWeight.w700, color: Colors.black87),
                    ),
                    const Gap(10),
                    TextFormField(
                      validator: (val) => (val == "") ? '标题不能为空' : null,
                      onChanged: (val) {
                        setState((() => title = val));
                      },
                      decoration: Styles.textInputDecoration3.copyWith(hintText: "标题")
                    ),
                    const Gap(30),
                    Text(
                      "副标题",
                      style: Styles.headLineStyle3
                          .copyWith(fontWeight: FontWeight.w700, color: Colors.black87),
                    ),
                    const Gap(10),
                    TextFormField(
                      validator: (val) => (val == "") ? '副标题也会很有用的' : null,
                      onChanged: (val) {
                        setState((() => subtitle = val));
                      },
                      decoration: Styles.textInputDecoration3.copyWith(hintText: "副标题")
                    ),
                    const Gap(30),
                    Text(
                      "正文",
                      style: Styles.headLineStyle3
                          .copyWith(fontWeight: FontWeight.w700, color: Colors.black87),
                    ),
                    const Gap(10),
                    TextFormField(
                      minLines: 15,
                      maxLines: null,
                      validator: (val) => (val == "") ? '正文不能为空' : null,
                      onChanged: (val) {
                        setState((() => mainText = val));
                      },
                      decoration: Styles.textInputDecoration3.copyWith(hintText: "写点什么吧 ")
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
