import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_auth_firebase/services/auth_service.dart';
import 'package:flutter_login_auth_firebase/widget/my_button.dart';
import 'package:flutter_login_auth_firebase/widget/my_imagebutton.dart';
import 'package:flutter_login_auth_firebase/widget/my_textfile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//Text Editing Controller
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  final configPasswordController = TextEditingController();

//Sign user up method
  void SignUserUp() async {
    //show loading circule
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // try creating the user
    try {
      //check if password is confirmed
      if (PasswordController.text == configPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: PasswordController.text);
      } else {
        //show error massage, password don't Match
        ShowErrorMassage("Password don't match!");
      }
      //pop the loading circuler
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circuler
      Navigator.pop(context);

      ShowErrorMassage(e.code);
    }
  }

  void ShowErrorMassage(String Massage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[300],
            title: Text(Massage),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 25),
              const Icon(
                Icons.lock,
                size: 50,
              ),
              const SizedBox(height: 25),
              Text(
                "Let\'s create an account for you! ",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextFiled(
                controler: emailController,
                hintTex: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextFiled(
                controler: PasswordController,
                hintTex: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFiled(
                controler: configPasswordController,
                hintTex: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(
                height: 25,
              ),
              MyButton(
                onTap: SignUserUp,
                text: "Sign Up",
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or Continue With',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton(
                      onTap: () {
                        AuthService().signIWithGoogle();
                      },
                      ImagePath: 'lib/image/google.png'),
                  SizedBox(
                    width: 25,
                  ),
                  ImageButton(onTap: () {}, ImagePath: 'lib/image/facebook.png')
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
