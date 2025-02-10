
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../componnet/chatbuble.dart';
import '../const.dart';
import '../main.dart';
import '../models/modelmessage.dart';

class Chatpage extends StatelessWidget {
  Chatpage({super.key});
  static String id = "ChatPage";
  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  CollectionReference message = FirebaseFirestore.instance.collection("messages");

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings!.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy("createdAt", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  SizedBox(width: 120),
                  Image.asset("assets/images/scholar.png", height: 50),
                  Text("Chat", style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: "pacifico")),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? chatbuble(message: messagesList[index], email: email)
                          : chatbublef(message: messagesList[index], email: messagesList[index].id);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      message.add({
                        "text": data,
                        "createdAt": DateTime.now(),
                        "id": email,
                      });
                      controller.clear();
                      _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
                    },
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      suffixIcon: Icon(Icons.send, color: kPrimaryColor),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
