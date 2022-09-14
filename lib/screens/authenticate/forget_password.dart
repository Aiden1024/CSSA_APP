import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:utmcssa_app/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:utmcssa_app/utils/loading.dart';
import '../../services/auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = '';
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        title: Text("忘记密码", style: Styles.headLineStyle2,),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Styles.standardHorizontalMargin, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                child: Center(child: loading? CircularProgressIndicator() : Text(error, style: TextStyle(color: Colors.red),)),
              ),

              TextFormField(
                  initialValue: '',
                  validator: (val) =>
                  val!.isEmpty ? '请输入邮箱地址' : null,
                  onChanged: (val) {
                    setState((() => email = val));
                  },
                  decoration: Styles.textInputDecoration2
                      .copyWith(
                      labelText: '邮箱',
                      icon: null)),
              const Gap(20),
              SizedBox(
                width: 1000,
                height: 50,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.email_outlined),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Colors.red)))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.resetPassword(email);

                        if (result.runtimeType == String) {
                            setState(() {
                              loading = false;
                              error = result;
                            });


                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("已发送邮件，请查收"),
                            ),
                          );
                          Get.back();
                        }
                      }
                    },
                    label: Text('发送密码重置邮件')),
              )

            ],
          ),
        )
      ),
    );
  }
}
