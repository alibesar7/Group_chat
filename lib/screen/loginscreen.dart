import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../componnet/coustem_button.dart';
import '../componnet/coustem_text_failed.dart';
import '../const.dart';
import '../main.dart';
import 'Rgisterscreen.dart';
import 'chatpage.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 75),
                Image.asset("assets/images/scholar.png", height: 100),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Ali Chat",
                    style: TextStyle(fontSize: 32, fontFamily: 'pacifico', color: Colors.white),
                  ),
                ),
                SizedBox(height: 75),
                Text("LOGIN", style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(height: 15),
                CustomFormTextField(

                  onChange: (data) {
                    email = data;
                  },
                  hintText: "Email",
                ),
                SizedBox(height: 15),
                CustomFormTextField(

                  onChange: (data) {
                    password = data;
                  },
                  hintText: "Password",
                ),
                SizedBox(height: 10),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await loginUser();
                        Navigator.pushNamed(context, Chatpage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "user-not-found") {
                          showSnackbar(context, "User not found");
                        } else if (e.code == "wrong-password") {
                          showSnackbar(context, "Wrong password");
                        }
                      } catch (e) {
                        showSnackbar(context, "There was an error");
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  text: "Login",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have an Account?", style: TextStyle(color: Colors.white)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id2);
                      },
                      child: Text("  Register", style: TextStyle(color: Colors.blueAccent, fontSize: 20)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email!, password: password!);
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
