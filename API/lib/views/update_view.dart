import 'package:first_project/api/getID.dart';
import 'package:first_project/api/update.dart';
import 'package:flutter/material.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({super.key});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  Name put = Name(firstName: "", lastName: "", id: "");
  Future<Name>? future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Data")),
      body: Column(
        children: [
          future != null
              ? FutureBuilder(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Text(
                          "after update : ${snapshot.data!.id}. ${snapshot.data!.firstName} ${snapshot.data!.lastName}",
                        );
                      } else {
                        return Text(snapshot.error.toString());
                      }
                    }
                    return CircularProgressIndicator();
                  },
                )
              : Text("Enter Data: "),

          Field(
            label: "id",
            change: (value) => put = Name(
              firstName: put.firstName,
              lastName: put.lastName,
              id: value,
            ),
          ),

          Field(
            label: "first name",
            change: (value) => put = Name(
              firstName: value,
              lastName: put.lastName,
              id: put.id,
            ),
          ),

          Field(
            label: "last name",
            change: (value) => put = Name(
              firstName: put.firstName,
              lastName: value,
              id: put.id,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                print(put.id);
                future = update(put);
              });
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  final String label;
  final void Function(String) change;
  const Field({super.key, required this.label, required this.change});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: change,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: label,
        ),
      ),
    );
  }
}
