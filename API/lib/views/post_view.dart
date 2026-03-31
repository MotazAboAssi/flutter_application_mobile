import 'package:first_project/api/post.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  Future<PostName>? future;
  late PostName post = PostName(firstName: "", lastName: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Name")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: MessageRequist(future: future)),
            Button(
              hint: "first name",
              change: (value) {
                post = PostName(firstName: value, lastName: post.lastName);
              },
            ),
            Button(
              hint: "last name",
              change: (value) {
                post = PostName(firstName: post.firstName, lastName: value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  future = postName(post);
                });
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageRequist extends StatelessWidget {
  const MessageRequist({super.key, required this.future});

  final Future<PostName>? future;

  @override
  Widget build(BuildContext context) {
    return future != null
        ? FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "Done Post : ${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        : CircularProgressIndicator();
  }
}

class Button extends StatelessWidget {
  final String hint;
  final void Function(String) change;
  const Button({super.key, required this.hint, required this.change});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: change,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
