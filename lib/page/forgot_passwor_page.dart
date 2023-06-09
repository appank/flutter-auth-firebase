import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_auth_firebase/widget/my_button.dart';
import 'package:flutter_login_auth_firebase/widget/my_textfile.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailControler = TextEditingController();
  @override
  void dispose() {
    emailControler.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailControler.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.lock,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter You Email and  we will send you a password reset link',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextFiled(
              controler: emailControler,
              hintTex: 'Email',
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: passwordReset,
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.black,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
