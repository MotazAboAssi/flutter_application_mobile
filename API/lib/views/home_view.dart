import 'package:first_project/views/delete_view.dart';
import 'package:first_project/views/get_all_view.dart';
import 'package:first_project/views/get_id_view.dart';
import 'package:first_project/views/post_view.dart';
import 'package:first_project/views/update_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(buttonName: 'display', target: const GetAllView()),
            Button(buttonName: 'get', target: const GetIdView()),
            Button(buttonName: 'post', target: const PostView()),
            Button(buttonName: 'delete', target: const DeleteView()),
            Button(buttonName: 'update', target: const UpdateView()),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String buttonName;
  final Widget target;
  const Button({super.key, required this.buttonName, required this.target});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) => target),
        );
      },
      child: Text(buttonName, style: TextStyle(color: Colors.white)),
    );
  }
}
