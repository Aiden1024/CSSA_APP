import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';
import 'package:gap/gap.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

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
                    onPressed: canPost() ? () {} : null,
                    child: Text("确定")))
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
                      decoration: Styles.textInputDecoration3.copyWith()
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
                      decoration: Styles.textInputDecoration3.copyWith()
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
                      decoration: Styles.textInputDecoration3.copyWith()
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
