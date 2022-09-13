import 'package:flutter/material.dart';
import 'package:utmcssa_app/utils/app_styles.dart';

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
                      icon: null)),
              ElevatedButton.icon(
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
                      dynamic result =
                      await _auth.ResetPassword(email);
                      if (result.runtimeType == String) {
                        print("DEBUG:  INT HE NULL OF RESULT MEANS USER FAILED");
                        if (this.mounted) {
                          print("DEBUG STILL MOUNTED");
                          setState(() {
                            loading = false;
                            error = result;
                          });
                        }

                      }
                    }
                  },
                  label: Text('发送密码重置邮件'))

            ],
          ),
        )
      ),
    );
  }
}
