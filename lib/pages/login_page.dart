import 'package:authconnect/components/my_button.dart';
import 'package:authconnect/components/my_textfield.dart';
import 'package:authconnect/components/squareTile.dart';
import 'package:authconnect/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authconnect/utils/globals_colors.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        // print('Wrong password.');
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong Email!'),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong Password!'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.offWhiteColor.withOpacity(.2),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                // Logo
                const Icon(
                  Icons.back_hand,
                  size: 100,
                ),

                const SizedBox(
                  height: 30,
                ),

                Text(
                  'Welcome back you have been missed! ',
                  style: TextStyle(color: GlobalColors.darkgray, fontSize: 16),
                ),

                const SizedBox(
                  height: 25,
                ),

                TextFieldPage(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldPage(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 12,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.grey[600],
                            decoration: TextDecoration.underline,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                ButtonPage(
                  text: "Sign In",
                  onTap: signUserIn,
                ),

                const SizedBox(
                  height: 32,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                              color: GlobalColors.darkgray, fontSize: 12),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'assets/images/Google.png'),
                    SizedBox(
                      width: 16,
                    ),
                    SquareTile(
                        onTap: () => {}, imagePath: 'assets/images/Apple.png'),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Register Now',
                            style: TextStyle(
                                fontSize: 12,
                                color: GlobalColors.mainSecColor,
                                decoration: TextDecoration.underline,
                                decorationColor: GlobalColors.mainSecColor)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
