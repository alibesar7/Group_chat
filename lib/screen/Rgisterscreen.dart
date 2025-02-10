import 'package:chatapp/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../componnet/coustem_button.dart';
import '../componnet/coustem_text_failed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String id2 = "RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();

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
            child: Column(
              children: [
                Spacer(flex: 1),
                Image.asset("assets/images/scholar.png"),
                Text(
                  "Ali Chat",
                  style: TextStyle(fontSize: 32, fontFamily: 'pacifico', color: Colors.white),
                ),
                Spacer(flex: 1),
                Row(
                  children: [
                    Text("Register", style: TextStyle(fontSize: 24, color: Colors.white)),
                  ],
                ),
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
                        await registerUser();
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          showSnackbar(context, "Weak password");
                        } else if (e.code == "email-already-in-use") {
                          showSnackbar(context, "Email already in use");
                        }
                      } catch (e) {
                        showSnackbar(context, "There was an error");
                      }
                      setState(() {
                        isLoading = false;
                      });
                      showSnackbar(context, "Saved");
                      Navigator.of(context).pop();
                    }
                  },
                  text: "Register",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an Account?", style: TextStyle(color: Colors.white)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("  Login", style: TextStyle(color: Colors.blueAccent, fontSize: 20)),
                    ),
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}