import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:utmcssa_app/screens/authenticate/register.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:utmcssa_app/utils/loading.dart';
import '../../services/auth.dart';

import '../../utils/app_styles.dart';
import '../../utils/shared.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({
    Key? key,
    required this.toggleView,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  bool loading = false;
  String error = '';

  String emailError = '';
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/cssa_bg.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(60),
                  Container(
                      child: Center(
                    child: Image.asset(
                      'assets/images/logo_text.png',
                      height: 150,
                      width: 150,
                    ),
                  )),
                  Text(
                    "欢迎来到CSSA",
                    style: Styles.headLineStyle1.copyWith(fontSize: 30),
                  ),
                  const Gap(20),
                  Text(error, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  //
                  // TextFormField
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
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
                                        icon: Icon(Icons.email_outlined))),
                            TextFormField(
                                validator: (val) =>
                                    val!.length < 6 ? '请输入大于6位的密码' : null,
                                onChanged: (val) {
                                  setState((() => password = val));
                                },
                                obscureText: true,
                                initialValue: '',
                                decoration: Styles.textInputDecoration2
                                    .copyWith(
                                        labelText: '密码',
                                        icon: Icon(Icons.key_outlined))),
                            const Gap(30),
                            SizedBox(
                                width: 1000,
                                height: 50,
                                child: ElevatedButton(
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
                                        dynamic result =
                                            await _auth.SignInWithEmailPassword(
                                                email, password);
                                        if (result == null) {
                                          print("DEBUG:  INT HE NULL");
                                          setState(() {
                                            loading = false;
                                            error = "错误：请检查邮箱密码或网络设置";
                                          });

                                        }
                                      }
                                    },
                                    child: Text('登录'))),
                            const Gap(15),
                            GestureDetector(
                              child: Text(
                                '还没有账号？前往注册',
                                style: TextStyle(color: Colors.red),
                              ),
                              onTap: () {
                                widget.toggleView();
                              },
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
  }
}
