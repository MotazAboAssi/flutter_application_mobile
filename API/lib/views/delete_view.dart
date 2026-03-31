import 'package:first_project/api/delete.dart';
import 'package:first_project/api/get.dart';
import 'package:flutter/material.dart';

class DeleteView extends StatefulWidget {
  const DeleteView({super.key});

  @override
  State<DeleteView> createState() => _DeleteViewState();
}

class _DeleteViewState extends State<DeleteView> {
   Future<Name>? future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete Name")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          future != null
              ? FutureBuilder(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text(
                          "${snapshot.data!.id}. ${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                        );
                      } else {
                        return Text(snapshot.error.toString());
                      }
                    }
                    return CircularProgressIndicator();
                  },
                )
              : Text("Enter ID : "),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                setState(() {
                  print("intro");
                  future = deleteName(int.parse(value));
                });
              },
              decoration: InputDecoration(
                labelText: "id",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
