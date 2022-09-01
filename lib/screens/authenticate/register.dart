import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:utmcssa_app/screens/authenticate/sign_in.dart';
import 'package:utmcssa_app/utils/app_styles.dart';
import 'package:get/get.dart';
import 'package:utmcssa_app/utils/loading.dart';

import '../../services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key,}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email  = '';
  String password = '';

  String emailError = '';
  String passwordError = '';


  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cssa_bg.png'),
            fit: BoxFit.cover
          )
        ),
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
                )
            ),
            Text("欢迎来到CSSA", style: Styles.headLineStyle1.copyWith(fontSize: 30),),
            const Gap(20),
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
                          validator: (val) => val!.isEmpty ? '请输入邮箱地址' : null,
                          onChanged: (val) {
                            setState((() => email = val));
                          },

                          decoration: Styles.textInputDecoration2.copyWith(labelText: '邮箱', icon: Icon(Icons.email_outlined))
                      ),
                      TextFormField(

                          validator: (val) =>
                          val!.length < 6 ? '请输入大于6位的密码' : null,
                          onChanged: (val) {
                            setState((() => password = val));
                          },

                          obscureText: true,
                          initialValue: '',

                          decoration: Styles.textInputDecoration2.copyWith(labelText: '密码', icon: Icon(Icons.key_outlined))
                      ),
                      TextFormField(
                          validator: (val) =>
                          val != password ? '请与之前密码相符' : null,

                          obscureText: true,
                          initialValue: '',
                          decoration: Styles.textInputDecoration2.copyWith(labelText: '再次输入密码', icon: Icon(Icons.password_outlined))
                      ),
                      const Gap(30),
                      SizedBox(
                          width: 1000,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.red)
                                      )
                                  )
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.regWithEmailPassword(email, password);
                                  if (result == null) {

                                    setState(() { loading = false;});
                                  }
                                }
                              },
                              child: Text('注册')

                          )
                      ),
                      const Gap(15),
                      GestureDetector(

                        child: Text('已经是UTMCSSA一员？ 请登录', style: TextStyle(color: Colors.red),),
                        onTap: () {
                          Get.to(() => SignIn(), transition: Transition.rightToLeft, duration: Duration(seconds: 1));
                        },
                      )
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
