import 'package:chatapp/models/modelmessage.dart';
import 'package:chatapp/screen/Rgisterscreen.dart';
import 'package:chatapp/screen/chatpage.dart';
import 'package:chatapp/screen/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'const.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB78w4oUn3y-x_VKdJ0CU-RG8rfa6ZS1rA",
      appId: "1:445830349275:android:949a613b8b2f2b97e927fe",
      messagingSenderId: "445830349275",
      projectId: "chat-app-4b14c",
    ),
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id2: (context) => RegisterScreen(),
        Chatpage.id: (context) => Chatpage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
    );
  }
}




class chatbublef extends StatelessWidget {
  final Message message;
  final String email;

  chatbublef({super.key, required this.message, required this.email});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Text(email, style: TextStyle(color: Colors.black, fontSize: 12)),
          Container(
            padding: EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
                bottomLeft: Radius.circular(36),
              ),
              color: Color(0xff006D84),
            ),
            child: Text(message.message, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
