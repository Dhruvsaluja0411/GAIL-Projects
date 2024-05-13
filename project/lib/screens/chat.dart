import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/chat_messages.dart';
import 'package:project/widgets/new_messages.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    Color appbarColor = Color.fromARGB(255, 216, 244, 147);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 68, 34, 236),
          // leading: Icon(Icons.chat_bubble,color: Color.fromARGB(255, 122, 239, 189),),
          title: Text('ChatApp',style: TextStyle(color: appbarColor),),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: appbarColor
                )),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            // gradient: LinearGradient(colors: [Color.fromARGB(255, 215, 239, 247),Color.fromARGB(255, 236, 240, 181)],begin: Alignment.topLeft,end: Alignment.bottomRight),
          image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),fit: BoxFit.cover),
          
          ),
          child: const Column(
            children: [
              Expanded(
                child: ChatMessages(),
              ),
              NewMessage(),
            ],
          ),
        ));
  }
}
