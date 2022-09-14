import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utmcssa_app/models/user_profile.dart';
import 'package:utmcssa_app/utils/app_styles.dart';
import 'package:gap/gap.dart';
import '../../../models/user.dart';
import 'package:get/get.dart';

import '../../../services/database.dart';

class InfoEdit extends StatefulWidget {
  const InfoEdit({Key? key, required this.uP}) : super(key: key);
  final UserProfile uP;

  @override
  State<InfoEdit> createState() => _InfoEditState();
}

class _InfoEditState extends State<InfoEdit> {
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = "";
  String username = "";
  String bio = "";
  

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser?>(context);
    DatabaseService dbs = DatabaseService(appUser!.uid);

    if (username == "" && bio == "") {username = widget.uP.username; bio = widget.uP.bio;}


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          "编辑信息",
          style: Styles.headLineStyle2,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Styles.standardHorizontalMargin, vertical: 30),
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                      initialValue: widget.uP.username,
                      validator: (val) => (val!.length < 3 || val.length > 20)
                          ? '用户名请大于3或小于20字符'
                          : null,
                      onChanged: (val) {
                        setState((() => username = val));
                        print(username);
                      },
                      decoration: Styles.textInputDecoration2.copyWith(
                          labelText: '用户名', icon: Icon(Icons.person))),
                  const Gap(30),
                  TextFormField(
                    maxLength: 50,
                      maxLines: null,
                      initialValue: widget.uP.bio,
                      validator: (val) =>
                          (val!.length > 50) ? '简介字数请小于50' : null,
                      onChanged: (val) {
                        setState(() {

                          bio = val;
                        });
                      },
                      decoration: Styles.textInputDecoration2.copyWith(
                          labelText: '简介',
                          icon: Icon(Icons.note_alt_outlined))),
                  const Gap(30),
                  SizedBox(
                      width: 1000,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              if (username == widget.uP.username && bio == widget.uP.bio) {
                                Get.back();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("信息未改变"),
                                  ),
                                );
                                return;
                              }

                              print("DEBUG IN INFO edit");
                              print(username);
                              print(bio);

                              dynamic result = await dbs.updateUserDataInProfile(username, bio);

                              if (result.runtimeType == String) {
                                setState(() {
                                  loading = false;
                                  error = result;
                                });


                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("已保存"),
                                  ),
                                );
                                Get.back();
                                return;
                              }
                            }

                          },
                          child: Text('保存'))),
                  const Gap(15),
                  loading ? CircularProgressIndicator() : Text(error)
                ],
              )),
        ),
      ),
    );
  }
}
