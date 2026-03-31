import 'package:chat_app/constant/theme.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chat = [
      {"content": "", "time message": "", "isMe": true},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Chat",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 30,
                color: primaryThemeText,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image(image: AssetImage("assets/images/scholar.png")),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10),
              children: [
                Latter(content: "oh the mazary", isMe: true),
                Latter(content: "every body want be my enemy", isMe: false),
                Latter(content: "spare the sympathy", isMe: false),
                Latter(content: "every body want be", isMe: true),
                Latter(content: "MY ENEMY ", isMe: false),
                Latter(content: "ENEMY ", isMe: true),
                Latter(content: "ME ", isMe: false),
                Latter(content: "ME ", isMe: true),
              ],
            ),
          ),
          Container(
            color: primary,
            width: double.infinity,
            height: 50,
            child: Container(child: Row(children: [])),
          ),
        ],
      ),
    );
  }
}

class Latter extends StatelessWidget {
  final String content;
  final bool isMe;
  const Latter({super.key, required this.content, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,

      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        (isMe
            ? IconProfile(isMe: isMe)
            : MessageModel(isMe: isMe, content: content)),
        (!isMe
            ? IconProfile(isMe: isMe)
            : MessageModel(isMe: isMe, content: content)),
      ],
    );
  }
}

class MessageModel extends StatelessWidget {
  const MessageModel({super.key, required this.isMe, required this.content});

  final bool isMe;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: isMe ? Radius.circular(10) : Radius.zero,
          bottomLeft: isMe ? Radius.zero : Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(
        left: isMe ? 8 : 0,
        right: isMe ? 0 : 8,
        bottom: 8,
      ),
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(
        minWidth: 100,
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: TextStyle(color: primaryThemeText, fontSize: 20),
          ),
          Text(
            timeNow(),
            style: TextStyle(color: primaryThemeText, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class IconProfile extends StatelessWidget {
  const IconProfile({super.key, required this.isMe});

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 20,
      minRadius: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage(
              isMe
                  ? "assets/images/domestic.webp"
                  : "assets/images/scholar.png",
            ),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

String timeNow() {
  return "${DateTime.now().hour < 12 ? DateTime.now().hour : DateTime.now().hour - 12}:${DateTime.now().minute} ${DateTime.now().hour < 12 ? "am" : "pm"}";
}
