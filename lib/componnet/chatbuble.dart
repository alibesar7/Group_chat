import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../models/modelmessage.dart';

class chatbuble extends StatelessWidget {
  final Message message;
  final String email;

  chatbuble({super.key, required this.message, required this.email});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child:Column(
          children: [
            Text(email, style: TextStyle(color: Colors.black, fontSize: 12)),
            Container(
              padding: EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                color: kPrimaryColor,
              ),
              child: Text(message.message, style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        )
    );
  }
}